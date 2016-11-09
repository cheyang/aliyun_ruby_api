require 'rubygems'
require 'aliyun_ruby_api'

#$DEBUG=true

options = {:access_key_id => "xxx",
           :access_key_secret => "xxx",
           :endpoint_url => "https://ecs.aliyuncs.com/"}


service = Aliyun::Service.new options

# https://help.aliyun.com/document_detail/25499.html?spm=5176.doc25556.6.255.QhuaPP
parameters = {:RegionId => "cn-beijing", 
			  :ImageId => "centos7u2_64_40G_cloudinit_20160728.raw", 
	          :InstanceType => "ecs.s1.small",
	          :SecurityGroupId => "sg-2zeiaqv7qgrwr9jcdbt5",
	          :Password => "Aliyun123",
	          :InternetMaxBandwidthOut => 5}

#puts service.DescribeInstanceStatus parameters

# create instance
resp = service.CreateInstance parameters

puts resp

id = resp["InstanceId"]

puts id

# allocate the public ip address
parameters = {:InstanceId => id}
resp = service.AllocatePublicIpAddress parameters
puts resp

# start instance
parameters = {:InstanceId => id}
resp = service.StartInstance parameters
puts resp