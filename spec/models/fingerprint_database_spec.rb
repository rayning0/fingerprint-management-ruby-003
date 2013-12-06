require 'spec_helper'

describe "FingerprintDatabase" do
  describe "::unknown_people_fingerpints" do
    it "should return the fingerprints in this database without people" do
      iafis = FingerprintDatabase.where(name: 'Integrated Automated Fingerprint Identification System').first

      iafis.unknown_people_fingerprints.count.should == 1
    end
  end

  describe "::fingerprint_counts" do
    it "should return a hash of the count of fingerprints for each database" do
      # HINT: Use a SQL GROUP (using arel)
      cf    = FingerprintDatabase.where(name: 'Criminal Fingerprints').first
      iafis = FingerprintDatabase.where(name: 'Integrated Automated Fingerprint Identification System').first
      foc   = FingerprintDatabase.where(name: 'Fingerprints of Criminals').first
      fs    = FingerprintDatabase.where(name: 'Flatiron School').first

      fingerprint_counts = FingerprintDatabase.fingerprint_counts

      fingerprint_counts[cf.id].should == 1
      fingerprint_counts[iafis.id].should == 3
      fingerprint_counts[foc.id].should == 2
      fingerprint_counts[fs.id].should == 1
    end
  end
end
