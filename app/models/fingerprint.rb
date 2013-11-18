class Fingerprint < ActiveRecord::Base
  attr_accessible :taken_at

  has_many :scanned_fingerprints
  has_many :fingerprint_scanners, through: :scanned_fingerprints

  belongs_to :fingerprint_database

  belongs_to :person
  has_many :criminal_histories, through: :person
end
