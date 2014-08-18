class Profile < ActiveRecord::Base
  has_one :patient
end
