class FingerprintScanner < ActiveRecord::Base
  has_many :scanned_fingerprints
  has_many :fingerprints, through: :scanner_fingerprints
end
