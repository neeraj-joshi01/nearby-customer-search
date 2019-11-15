require 'spec_helper'

class SearchServiceSpec
  describe "Test Search Service" do

    before(:each) do
      @constants = Constants.instance
      @search_service = SearchService.new({
        search_radius: 100,
        search_center_latitude: @constants.search_center_latitude,
        search_center_longitude: @constants.search_center_longitude
      })
    end

    it "should return customers within the given radius from the center geo points" do
      @search_service.add_customers_from_file(@constants.customers_list_url)
      expect(@search_service.result_heap.size).to eq(16)
      expect(
        @search_service.nearby_customers.first
      ).to eq("{\"latitude\":53.2451022,\"longitude\":-6.238335,\"name\":\"Ian Kehoe\",\"user_id\":4}")
    end
  end
end