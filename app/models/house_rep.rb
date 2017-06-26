class HouseRep < ActiveRecord::Base
  belongs_to :district

  def as_representative
    {
      first_name: first_name,
      middle_name: middle_name,
      last_name: last_name,
      gender: gender,
      dob: dob,
      party: party,
      phone: phone,
      website_url: website_url,
      facebook_account: facebook_account,
      twitter_account: twitter_account,
      term_end_date: term_end_date,
      began_office_year: began_office_at.year,
      ended_office_year: ended_office_at.nil? ? nil : ended_office_at.year,
      reelection_year: reelection_date.year
    }
  end
end
