# Vagrant Capistrano Push

Deploy or "push" application code in the same directory as your Vagrantfile to a remote server using [capistrano](http://capistranorb.com/).

## Installation

```
vagrant plugin install vagrant-capistrano-push
```

## Usage

```ruby
# Vagrantfile
config.push.define "staging", strategy: "capistrano" do |push|
  push.stage = "staging"
end

config.push.define "production", strategy: "capistrano" do |push|
  push.stage = "production"
end
```

And then

```
vagrant push production
```

Or if you are using ENV variables:

```ruby
# Vagrantfile
config.push.define "capistrano" do |push|
  push.stage = ENV["STAGE"]
end
```

And then

```
vagrant push
```

## Contributing

1. Fork it ( https://github.com/mfenner/vagrant-capistrano-push/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
