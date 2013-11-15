require 'spec_helper'

describe "Fingerprint" do
  describe "::for_offenders_of" do
    it "should return the fingerprints with criminal histories with the given incident type" do
      robbers = Fingerprint.for_offenders_of("Armed Robbery")
      robbers.count.should == 2

      CriminalHistory.where(incident_type: "Armed Robbery").each do |ch|
        robbers.should include(ch.person)
      end
    end
  end
end
