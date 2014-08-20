# Aliyun ECS API Client for Ruby


The Aliyun ECS API Client for Ruby 是调用 [阿里云 ECS服务](http://help.aliyun.com/view/11108189_13730407.html) 的 [Ruby](http://www.ruby-lang.org programming language)客户端类库.


## 安装

可以将下面一行加入Ruby应用的Gemfile:

    gem 'aliyun_ruby_api'

之后执行:

    $ bundle

或者直接执行:

    $ gem install aliyun_ruby_api

## 使用方法：

首先，需要在代码中引入以来的类库:

```
require 'rubygems'
require 'aliyun_ruby_api'
```

然后利用阿里云的access_key_id和access_key_secret初始化service对象

```
options = {:access_key_id => "xxxxxx", 
           :access_key_secret => "yyyyyy", 
           :endpoint_url => "https://ecs.aliyuncs.com/"}

service = Aliyun::Service.new options
```

这样, 你就可以根据 [阿里云弹性计算服务API参考手册](http://help.aliyun.com/view/11108189_13730407.html)初始化业务参数（除Action参数之外）为一个hash对象，并且将其作为参数传给Action方法（Action参数）。

```
parameters = {:[parameter_name] => [parameter_value]}

service.[Action] parameters
```

(1) 例如查询可用地域列表，其Action参数为DescribeRegions，而没有其他参数，代码如下

```
parameters = {}

service.DescribeRegions parameters
```

(2) 再比如查询可用镜像，代码如下

```
parameters = {:RegionId => "cn-beijing", :PageNumber => 2, :RageSize => 20}

service.DescribeImages parameters
```

注意:

如果想要输出更详细的debug信息，请将下面这行加入到阿里云API调用
If you want to output the debug info, please add this line before you call the API

```
$DEBUG = true

```


## Contributing

1. Fork it ( http://github.com/<my-github-username>/aliyun_ruby_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
