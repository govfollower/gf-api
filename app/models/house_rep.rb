class HouseRep < ActiveRecord::Base
  belongs_to :district

  def as_representative
    {
      first_name: first_name,
      middle_name: middle_name,
      last_name: last_name,
      gender: gender,
      party: party,
      elected_date: elected_date,
      phone: phone,
      website_url: website_url,
      facebook_account: facebook_account,
      twitter_account: twitter_account,
      dob: dob,
      term_end_date: term_end_date
    }
  end
end
