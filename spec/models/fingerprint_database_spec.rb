require 'spec_helper'

describe "FingerprintDatabase" do
  describe "::unknown_people" do
    it "should return the fingerprints in this database without people" do
      iafis = FingerprintDatabase.where(name: 'Integrated Automated Fingerprint Identification System').first

      iafis.unknown_people.count.should == 1
    end

    it "should use the Fingerprint::unknown_people method" do
      iafis = FingerprintDatabase.where(name: 'Integrated Automated Fingerprint Identification System').first
      iafis.unknown_people

      iafis.fingerprints.should_receive(:unknown_people)
    end
  end
end
