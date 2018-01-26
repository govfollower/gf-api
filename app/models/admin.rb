class Admin < ActiveRecord::Base
  devise :saml_authenticatable, :trackable
end
