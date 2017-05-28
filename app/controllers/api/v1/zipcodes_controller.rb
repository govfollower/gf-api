module Api::V1
  class ZipcodesController < ApiController

    def index
      render json: { static_json.to_json }, status: 200  
    end

    def show
      articles = [
        { id: 123, name: 'The Things' },
      ]

      respond_to do |format|
        format.json do
          render json: articles
        end    
      end
    end

    def static_json
      {
        "zipcode": "80203",
        "zipcode_range": "1234",
        "district": {
          "state_name": "Colorado",
          "state_abbr": "CO",
          "district_number": "1"
        },
        "senate": 
          [
            {
              "first_name": "John",
              "middle_name": "Paul",
              "last_name": "Doe",
              "gender": "M",
              "party": "R",
              "elected_date": "2016-04-15",
              "phone": "6265255253",
              "website_url": "https://someurl.com",
              "facebook_url": "https://someurl.com",
              "twitter_url": "https://someurl.com",
              "dob": "1966-03-18",
              "term_end_date": "2020-04-19"
            },
            {
              "first_name": "John",
              "middle_name": "Paul",
              "last_name": "Doe",
              "gender": "M",
              "party": "R",
              "elected_date": "2016-04-15",
              "phone": "6265255253",
              "website_url": "https://someurl.com",
              "facebook_url": "https://someurl.com",
              "twitter_url": "https://someurl.com",
              "dob": "1966-03-18",
              "term_end_date": "2020-04-19"   
            }
          ],
        "house": {
          "first_name": "John",
          "middle_name": "Paul",
          "last_name": "Doe",
          "gender": "M",
          "party": "R",
          "elected_date": "2016-04-15",
          "phone": "6265255253",
          "website_url": "https://someurl.com",
          "facebook_url": "https://someurl.com",
          "twitter_url": "https://someurl.com",
          "dob": "1966-03-18",
          "term_end_date": "2020-04-19" 
        }
      }
    end

  end
end
