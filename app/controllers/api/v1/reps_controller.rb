require 'uri'

module Api
  module V1
    class RepsController < ApiController

      def address
        reps = geocode_address if address_valid?
        if reps.present?
          render json: reps, status: 200
        else
          head 422
        end
      end

      def coordinates
        reps = geocode_coordinates if coordinates_valid?
        if reps.present?
          render json: reps, status: 200
        else
          head 422
        end
      end

      private

      def address_valid?
         params[:street].present? && params[:city].present? && params[:state].present?
      end

      def coordinates_valid?
         params[:lat].present? && params[:long].present?
      end

      def geocode_address
        address = {
          street: URI.encode(params[:street]),
          city: URI.encode(params[:city]),
          state: URI.encode(params[:state])
        }
        return CensusGeocoders::AddressGeocoder.new(address).perform
      end

      def geocode_coordinates
        return CensusGeocoders::CoordinatesGeocoder.new(params[:lat], params[:long]).perform
      end

    end
  end
end
