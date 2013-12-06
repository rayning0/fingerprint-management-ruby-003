class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :age

  has_many :fingerprints
  has_many :fingerprint_databases, through: :fingerprints
  has_many :scanned_fingerprints, through: :fingerprints
  has_many :criminal_histories
end
