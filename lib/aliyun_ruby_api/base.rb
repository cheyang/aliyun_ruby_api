module Aliyun
 
    ALIYUN_API_ENDPOINT='https://ecs.aliyuncs.com/'
    
    SEPARATOR = "&"
    
    HTTP_METHOD = "GET"
    
    $ENDPOINT_URL = nil
    
    
    $ACCESS_KEY_ID = nil
    
    
    $ACCESS_KEY_SECRET = nil
    
    
    DEFAULT_PARAMETERS = {:Format=>"json",
        :Version=>"2013-01-10", 
        :SignatureMethod=>"HMAC-SHA1", 
        :SignatureVersion=>"1.0"}
  
end