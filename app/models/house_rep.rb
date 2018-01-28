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

  def parse_propublica_result(res)
    m = HouseRep.new
    m.propublica_id = r['id']
    m.first_name = r['first_name']
    m.middle_name = r['middle_name']
    m.last_name = r['last_name']
    m.party = r['party']
    m.dob = r['date_of_birth']
    m.phone = r['phone']
    m.contact_form_url = r['contact_form']
    m.website_url = r['url']
    m.twitter_account = r['twitter_account']
    m.facebook_account = r['facebook_account']
    m.in_office = r['in_office']
    m
  end
end
