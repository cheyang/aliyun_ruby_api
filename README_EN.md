# Aliyun ECS API Client for Ruby


The Aliyun ECS API Client for Ruby is a library for connecting to and calling [The Aliyun ECS](http://help.aliyun.com/view/11108189_13730407.html?spm=5176.7376125.1997918129.6.k2vNso) from the [Ruby](http://www.ruby-lang.org programming language).


## Installation

Add this line to your application's Gemfile:

    gem 'aliyun_ruby_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aliyun_ruby_api

## Usage

First, you're probably gonna want to require it:

```
require 'rubygems'
require 'aliyun_ruby_api'
```

Then, you need to set 

```
options = {:access_key_id => "xxxxxx", 
           :access_key_secret => "yyyyyy", 
           :endpoint_url => "https://ecs.aliyuncs.com/"}

service = Aliyun::Service.new options
```

Now, you can call all the aliyun ECS API interface in the following way

```
parameters = {:[parameter_name] => :[parameter_value]}

service.[Action] parameters
```

(1) For example, if you want to use alyun ECS API to describe regions

```
parameters = {}

service.DescribeRegions parameters
```

(2) For example, if you want to use alyun ECS API to describe images template of a specified region

```
parameters = {:RegionId => "id", :PageNumber => "2", :RageSize => "20"}

service.DescribeImages parameters
```

Notice:

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
