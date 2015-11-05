# PageObjectOnDemand

*I will create page objects for you when you need them*

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'page_object_on_demand', groups: [:test]
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install page_object_on_demand

## Usage

### Rails with Rspec and Capybara

Follow following convention:

1. Put your page object files in one of the following directories:

  * `spec/features/pages/`
  * `spec/features/support/pages/`
  * `spec/pages/`

1. Keep one page object per file
1. `HomePage` class should be defined in `home_page.rb` file

```ruby
# spec/features/pages/home_page.rb
class HomePage < SitePrism::Page
  #...
end
```

Then you can access your page objects in your test just by calling the base name:

```ruby
feature "Home page" do
  scenario 'visit home page' do
    home_page.load
    expect(home_page).to be_displayed
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/page_object_on_demand. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

