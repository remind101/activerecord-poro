# ActiveRecord::Poro

This gem allows for plain old ruby objects to be associated with your ActiveRecord models.

## Installation

Add this line to your application's Gemfile:

    gem 'activerecord-poro'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-poro

## Usage

```ruby
class User < ActiveRecord::Base
end

class Message < ActiveRecord::Base
end

class Activity
  include Virtus.model

  attribute :action, String
  
  attribute :subject_type, String
  attribute :subject_id, Integer

  attribute :creator_type, String
  attribute :creator_id, Integer

  belongs_to :subject, polymorphic: true
  belongs_to :creator, polymorphic: true

  def initialize(*args)
    @association_cache = {}
    super
  end
end

message = Message.create
user    = User.create

activity = Activity.new(
  action: 'message.sent',
  creator_type: 'User',
  creator_id: user.id,
  subject_type: 'Message',
  subject_id: message.id
)

activity.subject
# => #<Message @id=1>

activity.creator
# => #<User @id=1>
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
