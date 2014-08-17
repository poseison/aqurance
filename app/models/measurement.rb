class Measurement < ActiveRecord::Base
  belongs_to :patient
  enum status: [ :active, :archived ]
end
