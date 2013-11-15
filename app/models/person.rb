class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  has_many :fingerprints
  has_many :fingerprint_databases, through: :fingerprint
  has_many :scanned_fingerprints, through: :fingerprint
  has_many :criminal_histories
end
