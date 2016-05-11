require 'yaml'

class Country
  @@country_codes = nil
  @@cached_countries = nil

  attr_reader :data

  ATTR_READERS = [
    :alpha2,
    :name,
    :eu_member
  ]

  ATTR_READERS.each do |meth|
    define_method meth do
      @data[meth.to_s]
    end
  end

  def initialize(country_code)
    @data = CountryList::Data.new(country_code).call
  end

  def <=>(other)
    to_s <=> other.to_s
  end

  def ==(other)
    @data == other.data
  end

  def valid?
    !(@data.nil? || @data.empty?)
  end

  def to_s
    name
  end

  def in_europe?
    @data && @data['eu_member'].nil? ? false : @data['eu_member']
  end
  alias_method :eu_member?, :in_europe?

  class << self

    # Returns big array with all countries
    def all
      CountryList::Data.countries.map{ |country_code, data| Country.new(country_code) }
    end

    def [](country_code)
      country = new(country_code)
      (country && country.valid?) ? country : nil
    end

    def country_codes
      CountryList::Data.country_codes
    end

  end

end