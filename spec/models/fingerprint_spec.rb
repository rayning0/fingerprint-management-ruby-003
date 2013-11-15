require 'spec_helper'

describe "Fingerprint" do
  describe "::for_offenders_of" do
    it "should return the fingerprints with criminal histories with the given incident type" do
      incident_type = IncidentType.where(name: "Armed Robbery").first

      robbers = Fingerprint.for_offenders_of(incident_type)
      robbers.count.should == 2

      incident_type.criminal_histories.each do |ch|
        ch.person.fingerprints.each do |fingerprint|
          robbers.should include(fingerprint)
        end
      end
    end
  end
end
