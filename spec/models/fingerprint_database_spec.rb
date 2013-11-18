require 'spec_helper'

describe "FingerprintDatabase" do
  describe "::unknown_people" do
    it "should return the fingerprints in this database without people" do
      iafis = FingerprintDatabase.where(name: 'Integrated Automated Fingerprint Identification System').first

      iafis.unknown_people.count.should == 1
    end
  end
end
