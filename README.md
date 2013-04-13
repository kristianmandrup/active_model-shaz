# ActiveModel::Shaz

## Installation

Add this line to your application's Gemfile:

    gem 'active_model-shaz'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_model-shaz

## Support

Currently auto-configures for Mongoid and ActiveRecord. Easy to configure for your particular "ORM",

## Usage

Mostly useful in REST API scenarios, where you want to transfer the model state to the client efficiently

```ruby
model.created?
model.deleted?

model.saved # save and return saved model
model.updated_with(name: 'hello') # update and return updated model
model.destroyed # destroy and return destroyed model
```

Controller usage example

```ruby
MyController < APIController
  def update
    render json: user.updated_with name: 'hello'
  end

  def destroy
    render json: user.destroyed
  end
end
```

When used with state tracking, this will add the `http_status` method so you can send the http status code, `201` or `204` auto-magically to your client in your JSON response via `ActiveModel::Serializer`. See f.ex [mongoid-serializer](https://github.com/kristianmandrup/mongoid-serializer) gem.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
