require 'spec_helper'

describe "FingerprintScanner" do
  describe "::has_scanned_fingerprints_for_database_id" do
    it "should return the scanners that scanned the fingerprints in a db" do
      db = FingerprintDatabase.where(name: "Integrated Automated Fingerprint Identification System").first
      scanners = FingerprintScanner.has_scanned_fingerprints_for_database_id(db.id)

      binding.pry

      scanners.count.should == 2
      scanners.should include(FingerprintScanner.where(location: 'Quantico').first)
      scanners.should include(FingerprintScanner.where(location: 'New York').first)
    end
  end
end
