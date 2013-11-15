class IncidentType < ActiveRecord::Base
  has_many :criminal_histories
  has_many :people, through: :criminal_histories
end
