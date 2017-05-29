class District < ActiveRecord::Base
  belongs_to :state
  has_one :house_rep
end
