class CriminalHistory < ActiveRecord::Base
  attr_accessible :incident_type

  has_one :incident_type
  belongs_to :person
end
