require 'rubygems'
require 'aliyun_ruby_api'
require 'json'

#$DEBUG=true

options = {:access_key_id => "LTAIJPfvBISmJ78y",
           :access_key_secret => "7RZYPistUW1QHIPYdQqcVzZPqdNsKM",
           :endpoint_url => "https://ecs.aliyuncs.com/"}


service = Aliyun::Service.new options


parameters = {:RegionId => "cn-beijing"}

#puts service.DescribeInstanceStatus parameters

my_hash = service.DescribeInstances parameters

puts JSON.pretty_generate(my_hash) 