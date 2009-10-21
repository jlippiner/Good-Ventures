require 'pp' #lets make things look pretty shall we

class Utils
  def initialize

  end

  def self.uuid()
    sql = "SELECT UUID()"
    record = ActiveRecord::Base.connection.select_one(sql)
    return record['UUID()']
  end

  def self.random_string(length=10)
    o =  [(0..9),('A'..'Z'),('a'..'z')].map{|i| i.to_a}.flatten
    (0..length).map { o[rand(o.length)] }.join
  end

  def self.gradients(hex1,hex2,steps)

    starts = Hash.new()
    starts["r"] = hex1[0,2].hex
    starts["g"] = hex1[2,2].hex
    starts["b"] = hex1[4,2].hex

    ends = Hash.new()
    ends["r"] =  hex2[0,2].hex
    ends["g"] = hex2[2,2].hex
    ends["b"] = hex2[4,2].hex

    step = Hash.new()
    step["r"] = (starts["r"] - ends["r"]) / (steps)
    step["g"] = (starts["g"] - ends["g"]) / (steps);
    step["b"] = (starts["b"] - ends["b"]) / (steps);

    gradient = []

    (0..steps-1).each {|i|
      rgb = Hash.new()
      rgb["r"] = (starts["r"] - (step["r"] * i)).floor
      rgb["g"] = (starts["g"] - (step["g"] * i)).floor
      rgb["b"] = (starts["b"] - (step["b"] * i)).floor

      hex = Hash.new()
      hex["r"] = sprintf("%02x", (rgb["r"]));
      hex["g"] = sprintf("%02x", (rgb["g"]));
      hex["b"] = sprintf("%02x", (rgb["b"]));

      hex_step = hex["r"] + hex["g"] + hex["b"]

      gradient << hex_step
    }

    return gradient

  end

  def self.weighted_average(dataset,days=7)
    weighted_avgs = []
    weighted_avg = 0

    dataset.each_cons(days) { |block|
      tot = 0

      block.reverse.each_with_index { |daily_val, day|
        multiplier = day + 1
        weighted_val = daily_val * multiplier
        tot += weighted_val
      }
            
      weighted_avg = tot / (days * (days + 1) / 2 )
      weighted_avgs << weighted_avg
    }

    return weighted_avg
  end

  def self.sum(array)
    array.inject(0) {|x,y| x + y}
  end

  def self.mean(array)
    return 0.0 if array.empty?
    array.inject(0) {|sum,x| sum += x } / array.size.to_f
  end

  def self.mean_variance_standard_deviation(array)
    sd = 0.0
    m = mean(array)
    count = array.size - 1
    variance = array.inject(0) {|variance,x| variance += (x-m) ** 2}
    sd = Math.sqrt(variance / count.to_f) if count.to_f > 0 
    return m, variance, sd
  end

  def self.min_sample_size(pop_size, conf_level=95,conf_interval=5)

    z = case conf_level
    when 90 then 1.65
    when 95 then 1.96
    when 99 then 2.58
    end

    conf_interval = (conf_interval.to_f/100) ** 2

    sample_size_v = ((z**2) * 0.5 * (1-0.5)) / conf_interval
    n = sample_size_v / (1 + (sample_size_v - 1) / pop_size)

    n
  end

  def tvalue(a1, a2)
    m1,v1 = mean_and_variance(a1)
    m2,v2 = mean_and_variance(a2)

    begin
      standard_error = Math.sqrt((v1/(a1.size-1))+((v2/(a2.size-1))))
      return ((m1-m2)/standard_error).to_f
    rescue
      return 0.00
    end
  end
  
  def self.commify(num)
    num.to_s.gsub(/(\d)(?=(\d{3})+$)/,'\1,')
  end

  # =============================================
  # = METHOD: get_site_groups_from_google(site) =
  # =============================================
  # Input: site in valid URI format
  # Output: array of groups passed on site
  #
  def get_site_groups_from_google(site)
    require 'rubygems'
    gem 'soap4r', '= 1.5.8'
    require 'adwords4r'

    begin
      creds_production = {
        'developerToken' => 'L3uOSV00fo-qDhGm1tjLOA',
        'applicationToken' => 'GtZ2GUP_anEkBpcQIaAsQA',
        'useragent' => 'Ruby Sample',
        'password' => '4ax52aws',
        'email' => 'aws@wripple.com',
        'clientEmail' => 'admin@wripple.com',
        'environment' => 'PRODUCTION',
      }

      creds_sandbox = {
        'developerToken' => 'aws@wripple.com++USD',
        'useragent' => 'Sample User Agent',
        'password' => '4ax52aws',
        'email' => 'aws@wripple.com',
        'clientEmail' => 'client_1+admin@wripple.com',
        'applicationToken' => 'IGNORED',
        'environment' => 'SANDBOX',
      }

      adwords = AdWords::API.new(AdWords::AdWordsCredentials.new(creds_production))
      # adwords = AdWords::API.new

      languages = %w{en}
      countries = %w{US}
      follow_links = false

      keyword_service = adwords.get_service(13, 'KeywordTool')
      kws = keyword_service.getKeywordsFromSite(site,follow_links,languages,countries)

      kws.getKeywordsFromSiteReturn.groups

    rescue Errno::ECONNRESET, SOAP::HTTPStreamError, SocketError => e
      # This exception indicates a connection-level error.
      # In general, it is likely to be transitory.
      puts 'Connection Error: %s' % e
      puts 'Source: %s' % e.backtrace.first

    rescue AdWords::Error::UnknownAPICall => e
      # This exception is thrown when an unknown SOAP method is invoked.
      puts e
      puts 'Source: %s' % e.backtrace.first

    rescue AdWords::Error::ApiError => e
      # This exception maps to receiving a SOAP Fault back from the service.
      # The e.soap_faultstring_ex, e.code_ex, and potentially e.trigger_ex
      # attributes are the most useful, but other attributes may be populated
      # as well. To display all attributes, the following can be used:
      #
      # e.instance_variables.each do |var|
      #   value = e.instance_variable_get(var)
      #   if ! value.nil?
      #     puts '%s => %s' % [var, value]
      #   end
      # end
      puts 'SOAP Error: %s (code: %d)' % [e.soap_faultstring_ex, e.code_ex]
      puts 'Trigger: %s' % e.trigger_ex unless e.trigger_ex.nil?
      puts 'Source: %s' % e.backtrace.first

    ensure
      # Display API unit usage info. This data is stored as a class variable
      # in the AdWords::API class and accessed via static methods.
      # total_units() returns a running total of units used in the scope of the
      # current program. last_units() returns the number used in the last call.
      puts
      puts '%d API units consumed total (%d in last call).' %
      [adwords.total_units, adwords.last_units]
    end
  end


end
