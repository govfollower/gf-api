require 'json'

module JsonImporters
  class HouseImporter

    def initialize
      @file_path = Rails.root + "app/assets/json/house.json"
    end

    def perform
      return false unless @file_path
      house_json = JSON.parse File.read(@file_path)
      house_reps = house_json['results'][0]['members']
      house_reps.each do |rep|
        state = State.find_by(state_abbr: rep['state'])
        district = District.find_by(state_id: state.id, district_number: rep['district']) if state.present?
        if district
          puts district
          district.create_house_rep!(
            first_name: rep['first_name'],
            middle_name: rep['middle_name'],
            last_name: rep['last_name'],
            party: rep['party']
          )
        end
      end
      true
    end

  end
end
