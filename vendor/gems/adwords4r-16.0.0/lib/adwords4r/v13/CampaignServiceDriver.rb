require 'adwords4r/v13/CampaignService'
require 'adwords4r/v13/CampaignServiceMappingRegistry'
require 'soap/rpc/driver'

module AdWords
module V13
module CampaignService

class CampaignInterface < ::SOAP::RPC::Driver
  DefaultEndpointUrl = "https://adwords.google.com/api/adwords/v13/CampaignService"

  Methods = [
    [ "",
      "addCampaign",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "https://adwords.google.com/api/adwords/v13", "addCampaign"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "https://adwords.google.com/api/adwords/v13", "addCampaignResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"AdWords::V13::CampaignService::ApiException"=>{:ns=>"https://adwords.google.com/api/adwords/v13", :namespace=>nil, :use=>"literal", :name=>"ApiException", :encodingstyle=>"document"}} }
    ],
    [ "",
      "addCampaignList",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "https://adwords.google.com/api/adwords/v13", "addCampaignList"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "https://adwords.google.com/api/adwords/v13", "addCampaignListResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"AdWords::V13::CampaignService::ApiException"=>{:ns=>"https://adwords.google.com/api/adwords/v13", :namespace=>nil, :use=>"literal", :name=>"ApiException", :encodingstyle=>"document"}} }
    ],
    [ "",
      "getActiveAdWordsCampaigns",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "https://adwords.google.com/api/adwords/v13", "getActiveAdWordsCampaigns"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "https://adwords.google.com/api/adwords/v13", "getActiveAdWordsCampaignsResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"AdWords::V13::CampaignService::ApiException"=>{:ns=>"https://adwords.google.com/api/adwords/v13", :namespace=>nil, :use=>"literal", :name=>"ApiException", :encodingstyle=>"document"}} }
    ],
    [ "",
      "getAllAdWordsCampaigns",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "https://adwords.google.com/api/adwords/v13", "getAllAdWordsCampaigns"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "https://adwords.google.com/api/adwords/v13", "getAllAdWordsCampaignsResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"AdWords::V13::CampaignService::ApiException"=>{:ns=>"https://adwords.google.com/api/adwords/v13", :namespace=>nil, :use=>"literal", :name=>"ApiException", :encodingstyle=>"document"}} }
    ],
    [ "",
      "getCampaign",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "https://adwords.google.com/api/adwords/v13", "getCampaign"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "https://adwords.google.com/api/adwords/v13", "getCampaignResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"AdWords::V13::CampaignService::ApiException"=>{:ns=>"https://adwords.google.com/api/adwords/v13", :namespace=>nil, :use=>"literal", :name=>"ApiException", :encodingstyle=>"document"}} }
    ],
    [ "",
      "getCampaignList",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "https://adwords.google.com/api/adwords/v13", "getCampaignList"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "https://adwords.google.com/api/adwords/v13", "getCampaignListResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"AdWords::V13::CampaignService::ApiException"=>{:ns=>"https://adwords.google.com/api/adwords/v13", :namespace=>nil, :use=>"literal", :name=>"ApiException", :encodingstyle=>"document"}} }
    ],
    [ "",
      "getCampaignStats",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "https://adwords.google.com/api/adwords/v13", "getCampaignStats"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "https://adwords.google.com/api/adwords/v13", "getCampaignStatsResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"AdWords::V13::CampaignService::ApiException"=>{:ns=>"https://adwords.google.com/api/adwords/v13", :namespace=>nil, :use=>"literal", :name=>"ApiException", :encodingstyle=>"document"}} }
    ],
    [ "",
      "getConversionOptimizerEligibility",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "https://adwords.google.com/api/adwords/v13", "getConversionOptimizerEligibility"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "https://adwords.google.com/api/adwords/v13", "getConversionOptimizerEligibilityResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"AdWords::V13::CampaignService::ApiException"=>{:ns=>"https://adwords.google.com/api/adwords/v13", :namespace=>nil, :use=>"literal", :name=>"ApiException", :encodingstyle=>"document"}} }
    ],
    [ "",
      "getOptimizeAdServing",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "https://adwords.google.com/api/adwords/v13", "getOptimizeAdServing"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "https://adwords.google.com/api/adwords/v13", "getOptimizeAdServingResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"AdWords::V13::CampaignService::ApiException"=>{:ns=>"https://adwords.google.com/api/adwords/v13", :namespace=>nil, :use=>"literal", :name=>"ApiException", :encodingstyle=>"document"}} }
    ],
    [ "",
      "getRecommendedBudgetList",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "https://adwords.google.com/api/adwords/v13", "getRecommendedBudgetList"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "https://adwords.google.com/api/adwords/v13", "getRecommendedBudgetListResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"AdWords::V13::CampaignService::ApiException"=>{:ns=>"https://adwords.google.com/api/adwords/v13", :namespace=>nil, :use=>"literal", :name=>"ApiException", :encodingstyle=>"document"}} }
    ],
    [ "",
      "getRecommendedBudgets",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "https://adwords.google.com/api/adwords/v13", "getRecommendedBudgets"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "https://adwords.google.com/api/adwords/v13", "getRecommendedBudgetsResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"AdWords::V13::CampaignService::ApiException"=>{:ns=>"https://adwords.google.com/api/adwords/v13", :namespace=>nil, :use=>"literal", :name=>"ApiException", :encodingstyle=>"document"}} }
    ],
    [ "",
      "setOptimizeAdServing",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "https://adwords.google.com/api/adwords/v13", "setOptimizeAdServing"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "https://adwords.google.com/api/adwords/v13", "setOptimizeAdServingResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"AdWords::V13::CampaignService::ApiException"=>{:ns=>"https://adwords.google.com/api/adwords/v13", :namespace=>nil, :use=>"literal", :name=>"ApiException", :encodingstyle=>"document"}} }
    ],
    [ "",
      "updateCampaign",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "https://adwords.google.com/api/adwords/v13", "updateCampaign"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "https://adwords.google.com/api/adwords/v13", "updateCampaignResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"AdWords::V13::CampaignService::ApiException"=>{:ns=>"https://adwords.google.com/api/adwords/v13", :namespace=>nil, :use=>"literal", :name=>"ApiException", :encodingstyle=>"document"}} }
    ],
    [ "",
      "updateCampaignList",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "https://adwords.google.com/api/adwords/v13", "updateCampaignList"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "https://adwords.google.com/api/adwords/v13", "updateCampaignListResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"AdWords::V13::CampaignService::ApiException"=>{:ns=>"https://adwords.google.com/api/adwords/v13", :namespace=>nil, :use=>"literal", :name=>"ApiException", :encodingstyle=>"document"}} }
    ]
  ]

  def initialize(endpoint_url = nil)
    endpoint_url ||= DefaultEndpointUrl
    super(endpoint_url, nil)
    self.mapping_registry = DefaultMappingRegistry::EncodedRegistry
    self.literal_mapping_registry = DefaultMappingRegistry::LiteralRegistry
    init_methods
  end

private

  def init_methods
    Methods.each do |definitions|
      opt = definitions.last
      if opt[:request_style] == :document
        add_document_operation(*definitions)
      else
        add_rpc_operation(*definitions)
        qname = definitions[0]
        name = definitions[2]
        if qname.name != name and qname.name.capitalize == name.capitalize
          ::SOAP::Mapping.define_singleton_method(self, qname.name) do |*arg|
            __send__(name, *arg)
          end
        end
      end
    end
  end
end


end
end
end
