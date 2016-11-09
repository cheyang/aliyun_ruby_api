require 'rubygems'
require 'aliyun_ruby_api'

#$DEBUG=true

options = {:access_key_id => "xxx",
           :access_key_secret => "xxxx",
           :endpoint_url => "https://ecs.aliyuncs.com/"}


service = Aliyun::Service.new options


parameters = {:RegionId => "cn-beijing", :PageNumber => 2, :RageSize => 100}

puts service.DescribeImages parameters