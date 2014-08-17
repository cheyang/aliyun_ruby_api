require 'net/http'
require 'time'
require 'securerandom'
require 'uri'
require 'base64'
require 'hmac-sha1'

module Aliyun
  
  class AliyunAPIException < RuntimeError
  end
  
  class Service
    
    
    
    attr_accessor :common_parameters
    
    attr_accessor :access_key_id
    
    attr_accessor :access_key_secret
    
    attr_accessor :endpoint_url
    
    def initialize(options = {})
      
      self.access_key_id = options[:access_key_id] || $ACCESS_KEY_ID || ""
      
      self.access_key_secret = options[:access_key_secret] || $ACCESS_KEY_SECRET || ""
      
      self.endpoint_url = options[:endpoint_url] || $ENDPOINT_URL || ALIYUN_API_ENDPOINT
      
    end
    
    def method_missing(method_name, *args)
      call_aliyun_with_parameter(method_name, args)
    end
    
    def call_aliyun_with_parameter(method_name, params)
      
      params = gen_request_parameters params
      
      
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
    
    #generate the parameters
    def gen_request_parameters params
      #add common parameters
      params.merge! DEFAULT_PARAMETERS
      
      params[:Action] = method_name.to_s
      
      params[:TimeStamp] = Time.now.utc.iso8601
      
      params[:SignatureNonce] = SecureRandom.uuid
      
      params[:Signature] = compute_signature params
      
      params
    end
    
    #compute the signature of the parameters String
    def compute_signature params
      
      sorted_keys = params.keys.sort
      
      canonicalized_query_string = ""
      
      sorted_keys.each {|key| canonicalized_query_string << SEPARATOR
                              canonicalized_query_string << percent_encode(key)
                              canonicalized_query_string << '='
                              canonicalized_query_string << percent_encode(params[key])
      }
      
      
      string_to_sign = HTTP_METHOD + SEPARATOR + percent_encode('/') + SEPARATOR
                   + percent_encode(canonicalized_query_string[1])
      
      signature = caculate_signature access_key_secret+"&", string_to_sign
      
    end
    
    def caculate_signature key, string_to_sign
      hmac = HMAC::SHA1.new(key)
      hmac.update(string_to_sign)
      Base64.encode64(hmac.digest)
    end
    
    #encode the value to aliyun's requirement
    def percent_encode value
      
      value = URI.encode_www_form_component(value).gsub(/+/,'%20'),gsub(/*/,'%2A'),gsub('%7E','~')
      
    end
    
  end
end