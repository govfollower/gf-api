require 'uri'

class GeocoderController < ApplicationController

  def new
    if is_address?
      reps = geocode_address
    elsif is_coordinates?
      reps = geocode_coordinates
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

  def is_address?
     params[:street].present? && params[:city].present? && params[:state].present?
  end

  def is_coordinates?
     params[:x].present? && params[:y].present?
  end

  def geocode_address
    address = {
      street: URI.encode(params[:street]),
      city: URI.encode(params[:city]),
      state: URI.encode(params[:state])
    }
    CensusGeocoders::AddressGeocoder.new(address).perform
  end

end
