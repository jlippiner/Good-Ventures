#!/usr/bin/ruby
#
# Copyright 2009, Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Handles credentials for the SOAP requests, for both <= v13 and >= v200902.

require 'soap/header/simplehandler'
require 'adwords4r/authtoken'

module AdWords

  # Handles the headers used in v200906 requests.
  class V200906HeaderHandler < SOAP::Header::SimpleHandler

    # Constructor for V200906HeaderHandler.
    #
    # Args:
    # - parent: AdWordsCredentials object containing the login credentials.
    #
    def initialize(parent)
      namespace = 'https://adwords.google.com/api/adwords/cm/v200906'
      super(XSD::QName.new(namespace, 'RequestHeader'))
      @parent = parent
    end

    # Handles callback.
    def on_simple_outbound
      return {
        :authToken => @parent.auth_token,
        :clientEmail => @parent.credentials['clientEmail'],
        :userAgent => @parent.credentials['userAgent'],
        :applicationToken => @parent.credentials['applicationToken'],
        :developerToken => @parent.credentials['developerToken'],
      }
    end
  end

  # Handles the headers used in <= v13 (both sandbox and production)
  class Pre200902HeaderHandler < SOAP::Header::SimpleHandler

    attr_reader :tag
    attr_writer :value

    # Constructor for Pre200902HeaderHandler.
    #
    # Args:
    # - tag: XML tag name to be handled (email, password, etc.)
    # - value: value to be sent inside tag on outgoing requests
    #
    def initialize(tag, value)
      super(XSD::QName.new(nil, tag))
      @tag = tag
      @value = value
    end

    # Handles callback.
    def on_simple_outbound
      @value
    end
  end

  # Generic credentials class, used for any API version.
  class AdWordsCredentials

    # Hash of credentials (credential key to value)
    attr_reader :credentials
    # The environment being used (production, sandbox)
    attr_reader :environment

    public

    # Constructor for AdWordsCredentials.
    #
    # Args:
    # - credentials: Hash of credentials (credential key to value). E.g.:
    #    {
    #     'developerToken' => 'user@domain.com++USD',
    #     'useragent' => 'Sample User Agent',
    #     'password' => 'password',
    #     'email' => 'user@domain.com',
    #     'clientEmail' => 'client_1+user@domain.com',
    #     'applicationToken' => 'IGNORED',
    #     'environment' => 'SANDBOX'
    #    }
    #
    def initialize(credentials=nil)
      @credentials = {}
      @environment = nil
      @auth_token = nil
      @handlers = []
      credentials = get_defaults() if credentials.nil?
      credentials.each do |key, value|
        # 'environment' shouldn't go in the credentials array, and we'll ignore
        # 'alternateUrl' to avoid errors on upgraders' apps.
        if key =~ /^alternateUrl/
          raise AdWords::Error::Error,
              "'alternateUrl' is no longer supported. Please consult the " +
              "Readme on how to use 'environment' instead."
        elsif !(key =~ /^environment/)
          @credentials[key] = value
        end
      end

      # The user agent header differs in v13 (useragent) and v2009 (userAgent).
      # Properly populate both values, and use the name of the program ($0) if
      # nothing is given.
      user_agent = 'adwords4r: %s' % (@credentials['useragent'] ||
        @credentials['userAgent'] || $0)
      @credentials['useragent'] = @credentials['userAgent'] = user_agent

      # The properties file may include the clientEmail in a clientId property.
      # clientId might be a clientCustomerId, though, so check to make sure it
      # is an email address before assigning it to clientEmail.
      # clientCustomerIds don't seem to be supported elsewhere in this client
      # library, so ignore them.
      if @credentials['clientEmail'].nil? and @credentials['clientId'] and
          @credentials['clientId'].include?('@')
        @credentials['clientEmail'] = @credentials['clientId']
      end

      # Set environment
      if credentials['environment'].nil?
        # First environment is default
        @environment = Service.get_environments[0]
      elsif !(Service.get_environments.include?(credentials['environment']))
        raise AdWords::Error::Error,
            "Unknown environment: #{credentials['environment']}"
      else
        @environment = credentials['environment']
      end

      # Fix potential problems with changing clientEmail, by forcing it to be
      # created
      @credentials['clientEmail'] = '' if @credentials['clientEmail'].nil?

      @credentials.each do |key, value|
        @handlers << Pre200902HeaderHandler.new(key, value)
      end
    end

    # Return a list of handlers to be inserted into the driver's handler list.
    #
    # Args:
    # - version: API version being used. Must be an integer.
    #
    # Returns:
    # The list of handlers (subclasses of SOAP::Header::SimpleHandler)
    #
    def get_handlers(version)
      if version <= 13 then
        return @handlers
      elsif version == 200906 then
        return [V200906HeaderHandler.new(self)]
      end
    end

    # Returns the authentication token used with >= v200902 requests.
    # Generates it if there's no valid token already generated.
    #
    # Returns:
    # The auth token (as a string).
    #
    def auth_token
      generate_auth_token if @auth_token.nil?
      return @auth_token
    end

    # Generates a new authentication token used with >= v200902 requests.
    # The generated token is stored and can later be accessed with auth_token.
    # It should only be necessary for user code to invoke this if the first
    # token expires.
    #
    # Returns:
    # The auth token (as a string).
    #
    def generate_auth_token
      email = @credentials['email']
      password = @credentials['password']

      if email.nil?
        raise AdWords::Error::AuthError,
            'Email address not included in credentials.'
      end

      if password.nil?
        raise AdWords::Error::AuthError, 'Password not included in credentials.'
      end

      @auth_token = AdWords::AuthToken::get_token(email, password)
      return @auth_token
    end

    # Change one of the authentication headers.
    #
    # Args:
    # - header: the name for the header being changed.
    # - value: the new value for the header.
    #
    def set_header(header, value)
      # Invalidate previous auth token if necessary
      @auth_token = nil if header == 'email' or header == 'password'

      @credentials.each_key do |key|
        if key == header then
          @credentials[key] = value
        end
      end

      @handlers.each do |handler|
        if handler.tag == header then
          handler.value = value
        end
      end
    end

    # Overloads the 'dup' method for AdWordsCredentials to correctly duplicate
    # objects of this class.
    #
    # Returns:
    # Duplicated AdWordsCredentials object
    #
    def dup
      creds = @credentials.dup
      # Remove the prepended 'adwords4r: ' string before creating the duplicate
      creds['userAgent']['adwords4r: '] = ''
      creds['environment'] = @environment unless @environment.nil?
      return AdWordsCredentials.new(creds)
    end

    private

    # Get the default credentials.
    # Loads them from the adwords.properties file in the directory specified by
    # the HOME environment variable.
    #
    # Returns:
    # Hash with the credentials (credential key to value).
    #
    def get_defaults
      cred = Hash.new
      IO.foreach(File.join(ENV['HOME'], 'adwords.properties')) do |line|
        unless line =~ /^#/
          split_line = line.split('=')
          cred[split_line[0].strip] = split_line[1].strip
        end
      end
      return cred
    end
  end
end
