class CriminalHistory < ActiveRecord::Base
  attr_accessible :incident_type

  belongs_to :incident_type
  belongs_to :person
end
