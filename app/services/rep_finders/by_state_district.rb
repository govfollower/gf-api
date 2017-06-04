require 'json'

module RepFinders
  class ByStateDistrict

    def initialize (state_abbr, district_no)
      @state = State.find_by(state_abbr: state_abbr)
      @district = District.find_by(state_id: @state.id, state_abbr: state_abbr) if @state.present?
    end

    def perform
      return false unless @district
      house_rep = @district.house_rep.as_representative 
      senate_reps = SenateReps.where(state_id: @state.id).as_representative
      reps = {
        senate: senate_reps,
        house: house_rep
      } 
    end

  end
end
