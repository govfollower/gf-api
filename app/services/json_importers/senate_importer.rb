require 'json'

module JsonImporters
  class SenateImporter

    def initialize
      @file_path = Rails.root + "app/assets/json/senate.json"
    end

    def perform
      return false unless @file_path
      senate_json = JSON.parse File.read(@file_path)
      senate_reps = senate_json['results'][0]['members']
      senate_reps.each do |rep|
        state = State.find_by(state_abbr: rep['state'])
        district = District.find_by(state_id: state.id, district_number: rep['district']) if state.present?
        if state
          state.senate_reps.create!(
            first_name: rep['first_name'],
            middle_name: rep['middle_name'],
            last_name: rep['last_name'],
            party: rep['party'],
            phone: rep['phone'],
            twitter_account: rep['twitter_account'],
            facebook_account: rep['facebook_account'],
            propublica_id: rep['id']
          )
        end
      end
      true
    end

  end
end
