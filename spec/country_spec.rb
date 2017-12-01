require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Country do
  let(:country) { Country.new('NL') }

  it 'allows to create a country object from a country code' do
    country = Country.new('NL')
    expect(country.data).not_to be_nil
  end

  it 'allows to create a country object from a lowercase alpha2 code' do
    country = Country.new('nl')
    expect(country.data).not_to be_nil
  end

  it "returns alpha2 code" do
    expect(country.alpha2).to eq('NL')
  end

  describe 'new' do
    it 'should return new country object when a valid alpha2 string is passed' do
      expect(Country.new('NL')).to be_a(Country)
    end

    it 'should return new country object when a valid alpha2 symbol is passed' do
      expect(Country.new(:nl)).to be_a(Country)
    end
  end


  describe '#valid?' do
    it 'should return true if country is valid' do
      expect(Country.new('NL')).to be_valid
    end

    it 'should return false if country is invalid' do
      expect(Country.new('NN')).not_to be_valid
    end
  end

  describe "in_europe?" do
    it "is in europe when country is in europe" do
      country = Country.new('NL')
      expect(country).to be_in_europe
    end

    it "is not in europe when country is outside europe" do
      country = Country.new('US')
      expect(country).to_not be_in_europe
    end
  end

  describe "eu_member?" do
    it "is true if country is a member of eu" do
      country = Country.new('NL')
      expect(country).to be_eu_member
    end

    it "is not true if country is not a member of eu" do
      country = Country.new('NO')
      expect(country).to_not be_eu_member
    end
  end

  it "returns alpha2 code" do
    expect(country.alpha2).to eq('NL')
  end

  it "returns currency_code" do
    expect(country.currency_code).to eq('EUR')
  end

  describe 'to_s' do
    it 'should return the country name' do
      expect(Country.new('NL').to_s).to eq('Netherlands')
    end
  end

  describe 'compare' do
    it 'should compare itself with other countries by its name' do
      canada = Country.new('CA')
      mexico = Country.new('MX')
      expect(mexico <=> canada).to eq(1)
      expect(canada <=> mexico).to eq(-1)
    end
  end

  describe "equality" do
    it "is equal when 2 countries are the same" do
      country1 = Country.new('NL')
      country2 = Country.new('NL')
      expect(country1 == country2).to be_truthy
    end

    it "is not equal when 2 countries different" do
      country1 = Country.new('NL')
      country2 = Country.new('US')
      expect(country1 == country2).to be_falsy
    end
  end

  describe 'all' do
    it 'should return an array list of all countries' do
      countries = Country.all
      expect(countries).to be_an(Array)
      expect(countries.first).to be_an(Country)
      expect(countries.size).to eq(250)
    end
  end

  describe "country_codes" do
    it 'returns an array with all country codes' do
      country_codes = Country.country_codes
      expect(country_codes).to be_an(Array)
      expect(country_codes.first).to be_an(String)
      expect(country_codes.first.length).to eq(2)
      expect(country_codes.size).to eq(250)
    end
  end

end