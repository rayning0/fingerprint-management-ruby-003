describe "IncidentType" do
  describe "::alphabetical" do
    it "should return an alphabetical list of incident types" do
      IncidentType.alphabetical.map { |it| it.name }.should ==  ["Armed Robbery", "Being Way Too Fly", "First Degree Murder", "Income Tax Evasion", "Manslaughter", "Pollywog Fighting", "Using AJAX Without a License", "Violation of the Volstead Act"]
    end
  end

  describe "#average_age_of_offenders" do
    it "should return the average age of people with a history of the incident" do
      armed_robbery = IncidentType.where(name: 'Armed Robbery').first

      armed_robbery.average_age_of_offenders.to_f.should == 27.0
    end
  end
end
