require 'spec_helper'

describe "FingerprintDatabase" do
  describe "::unknown_people_fingerpints" do
    it "should return the fingerprints in this database without people" do
      iafis = FingerprintDatabase.where(name: 'Integrated Automated Fingerprint Identification System').first

      iafis.unknown_people_fingerprints.count.should == 1
    end
  end
end
