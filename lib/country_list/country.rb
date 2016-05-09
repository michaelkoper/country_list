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
    Country.load_cached_countries unless @@cached_countries
    @data = @@cached_countries[country_code]
  end

  def valid?
    !(@data.nil? || @data.empty?)
  end

  def country_initialize(country_data)
    @data = country_data.is_a?(Hash) ? country_data : ISO3166::Data.new(country_data).call
  end

  def in_europe?
    @data['eu_member'].nil? ? false : @data['eu_member']
  end

  class << self

    # Returns big array with all countries
    def all
      Country.load_cached_countries unless @@cached_countries
      @@cached_countries
    end

    def [](country_code)
      country = new(country_code)
      (country && country.valid?) ? country : nil
    end

    def country_codes
      @@country_codes ||= YAML.load_file(datafile_path(%w(data country_codes.yaml)))
    end

    def load_cached_countries
      @@cached_countries ||= Marshal.load(File.binread(datafile_path(%w(cache countries ))))
    end

    def datafile_path(file_array)
      File.join([File.dirname(__FILE__)] + file_array)
    end

  end

end