# CountryList

I needed something very similar to http://github.com/hexorx/countries, but smaller, simpler and without any dependencies. CountryList is a tiny gem that gets all the countries, and makes country objects with some basic information inside each of them.

Inspired by [countries](http://github.com/hexorx/countries)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'country_list'
```

And then execute:

    $ bundle

Or install it yourself:

    $ gem install country_list

## Usage

Create a country object:

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
    country.currency_code # => 'EUR'

Compare countries

    netherlands = Country.new('NL')
    spain = Country.new('ES')
    netherlands == spain # false
    netherlands == Country.new('NL') # true

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

Please run rake update_cache each time you change an .yaml file.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/michaelkoper/country_list. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).