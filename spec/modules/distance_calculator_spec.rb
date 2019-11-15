class DistanceCalculatorSpec
  describe "Test distance calculation between geo points" do
    it "should calculate the distance between two points" do
      point_1 = [52.833502, -8.522366]
      point_2 = [53.339428, -6.257664]
      radius = 6371
      expect(DistanceCalculator.process(point_1, point_2)).to eq(161.4)
    end
  end
end