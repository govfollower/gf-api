require 'net/http'
require 'json'

module PropublicaApi
  class GetSenateRep 

    def initialize (senate_rep)
      @propublica_id = senate_rep.propublica_id
      return false unless @propublica_id.present?
    end

    def perform
      url = URI.parse("https://api.propublica.org/congress/v1/members/#{@propublica_id}.json")
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true 

      request = Net::HTTP::Get.new(url.request_uri)
      request.add_field("X-API-Key", "#{ENV['PROPUBLICA_API_KEY']}")

      response = http.request(request)
      response_as_hash = JSON.parse response.body
      return response_as_hash
    end

  end
end
