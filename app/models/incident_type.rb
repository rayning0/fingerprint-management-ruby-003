class IncidentType < ActiveRecord::Base
  attr_accessible :name

  has_many :criminal_histories
  has_many :people, through: :criminal_histories
end
