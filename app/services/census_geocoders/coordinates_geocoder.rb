require 'net/http'
require 'uri'

module CensusGeocoders
  class CoordinatesGeocoder

    def initialize (address)
      @url = URI.parse("https://geocoding.geo.census.gov/geocoder/geographies/address?street=#{address[:street]}&city=#{address[:city]}&state=#{address[:state]}&benchmark=Public_AR_Current&vintage=Current_Current&layers=54&format=json&key=#{ENV['CENSUS_BUREAU_API_KEY']}")
      @req = Net::HTTP::Get.new(@url.to_s)
    end

    def perform
      res = Net::HTTP.start(@url.host, @url.port) {|http|
        http.request(@req)
      }
      puts res.body
    end

  end
end
