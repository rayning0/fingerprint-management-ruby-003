class ScannedFingerprint < ActiveRecord::Base
  belongs_to :fingerprint
  belongs_to :fingerprint_scanner
end
