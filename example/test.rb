require 'rubygems'
require 'aliyun_ruby_api'

#$DEBUG=true

options = {:access_key_id => "xxxxx",
           :access_key_secret => "xxxxx",
           :endpoint_url => "https://ecs.aliyuncs.com/"}


service = Aliyun::Service.new options

parameters = {:RegionId => "cn-beijing"}

puts service.DescribeRegions parameters
