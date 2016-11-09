require 'rubygems'
require 'aliyun_ruby_api'

#$DEBUG=true

options = {:access_key_id => "******",
           :access_key_secret => "*******",
           :endpoint_url => "https://ecs.aliyuncs.com/"}


service = Aliyun::Service.new options

# here is the instance id
id = "i-2ze0zkx5pck9q7jtwhcd"
# stop instance
#parameters = {:InstanceId => id}
#resp = service.StopInstance parameters

#puts resp


# delete instance
parameters = {:InstanceId => id}
resp = service.DeleteInstance parameters

puts resp

