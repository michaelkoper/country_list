# CountryList

I needed something very simular to http://github.com/hexorx/countries but without any dependencies and a lot smaller and simpler. All kudos go to those guys! CountryList is a very tiny gem that basically gets all the countries and makes tiny little country objects with some very basic information inside each of them.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'country_list'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install country_list

## Usage

Simply create a country object like this:

    country = Country.new('NL')
    # or like this
    country = Country['NL']

Get all the countries in an Array:

    countries = Country.all

Get all the country_codes in an Array:

    country_codes = Country.country_codes

Get useful information about a country

    country = Country.new('NL')
    country.name # => 'Netherlands'
    country.eu_member? # => true
    country.alpha2 # => 'NL'

Compare countries

    netherlands = Country.new('NL')
    spain = Country.new('ES')
    netherlands == spain # false
    netherlands == Country.new('NL') # true

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/michaelkoper/country_list. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

