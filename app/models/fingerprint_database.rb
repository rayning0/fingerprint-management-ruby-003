class FingerprintDatabase < ActiveRecord::Base
  attr_accessible :name, :owner

  has_many :fingerprints
end
