require 'json'

module RepFinders
  class ByStateDistrict

    def initialize (state_abbr, district_no)
      @state = State.find_by(state_abbr: state_abbr)
      @district = District.find_by(state_id: @state.id, district_number: district_no.to_i) if @state.present?
    end

    def perform
      return false unless @district
      house_rep = @district.house_rep.as_representative 
      senate_reps = SenateRep.where(state_id: @state.id).map { |rep| rep.as_representative }
      reps = {
        senate: senate_reps,
        house: house_rep
      } 
    end

  end
end
