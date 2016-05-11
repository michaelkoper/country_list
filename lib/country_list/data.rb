require 'yaml'
module CountryList
  class Data
    @@country_codes = nil
    @@cached_countries = nil

    def initialize(country_code)
      @country_code = country_code.to_s.upcase
      Data.load_cached_countries unless @@cached_countries
    end

    def call
      @@cached_countries[@country_code]
    end

    class << self

      def datafile_path(file_array)
        File.join([File.dirname(__FILE__)] + file_array)
      end

      def country_codes
        @@country_codes ||= load_country_codes!
      end

      def load_cached_countries
        @@cached_countries ||= load_countries!
      end
      alias_method :countries, :load_cached_countries

      def load_countries!
        puts "load_countries!"
        Marshal.load(File.binread(datafile_path(%w(cache countries ))))
      end

      def load_country_codes!
        puts "load_country_codes!"
        YAML.load_file(datafile_path(%w(data country_codes.yaml)))
      end

    end

  end

end

