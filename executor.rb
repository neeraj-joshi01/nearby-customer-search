require 'pry'
require File.dirname(__FILE__) + '/app.rb'

class Executor
  def self.print_results
    constants = Constants.instance
    search_service = SearchService.new({
      search_radius: constants.search_radius,
      search_center_latitude: constants.search_center_latitude,
      search_center_longitude: constants.search_center_longitude
    })
    search_service.add_customers_from_file(constants.customers_list_url)

    puts search_service.nearby_customers

  end
end

Executor.print_results