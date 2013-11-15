class FingerprintScanner < ActiveRecord::Base
  attr_accessible :location

  has_many :scanned_fingerprints
  has_many :fingerprints, through: :scanned_fingerprints
end
