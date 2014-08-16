require 'net/http'

module Aliyun
  
  class AliyunAPIException < RuntimeError
  end
  
  class Service
    
    
    
    attr_accessor :common_parameters
    
    attr_accessor :access_key_id
    
    attr_accessor :endpoint_url
    
    def initialize(options = {})
      
      self.access_key_id = options[:access_key_id] || $ACCESS_KEY_ID || ""
      
      self.access_key_secret = options[:access_key_secret] || $ACCESS_KEY_SECRET || ""
      
      self.endpoint_url = options[:endpoint_url] || $ENDPOINT_URL || ALIYUN_API_ENDPOINT
      
    end
    
    def method_missing(method_name, *args)
      call_aliyun_with_parameter(method_name, args)
    end
    
    def call_aliyun_with_parameter(method_url, params)
      #add common parameters
      params.merge! DEFAULT_PARAMETERS
      
      uri = URI(endpoint_url)
      
      uri.query = URI.encode_www_form(params)
      
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true if (uri.scheme == "https")
      
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE 
      
      request = Net::HTTP::Get.new(uri.request_uri)
      
      response = http.request(request)
      
      case response
        when Net::HTTPSuccess
          
          return JSON.parse(response.body)
      else
        raise "response error code: #{response} and details #{response.body}"
      end
      
    end
    
  end
end