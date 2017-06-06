require 'uri'

module Api
  module V1
    class RepsController < ApiController

      def address
        if address_valid?
          reps = geocode_address
        else
          reps = false
        end

        if reps
          render json: reps, status: 200
        else 
          render status 422
        end
      end

      private

      def address_valid?
         params[:street].present? && params[:city].present? && params[:state].present?
      end

      def coordinates_valid?
         params[:x].present? && params[:y].present?
      end

      def geocode_address
        address = {
          street: URI.encode(params[:street]),
          city: URI.encode(params[:city]),
          state: URI.encode(params[:state])
        }
        return CensusGeocoders::AddressGeocoder.new(address).perform
      end

    end
  end
end
