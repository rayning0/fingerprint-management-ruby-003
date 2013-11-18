describe "IncidentType" do
  describe "::alphabetical" do
    it "should return an alphabetical list of incident types" do
      IncidentType.alphabetical.should ==  ["Armed Robbery", "Being Way Too Fly", "First Degree Murder", "Income Tax Evasion", "Manslaughter", "Pollywog Fighting", "Using AJAX Without a License", "Violation of the Volstead Act"]
    end
  end
end
