require 'pry'
require File.dirname(__FILE__) + '/app.rb'

class Executor
  def self.print_results
    constants = Constants.instance
    search_service = SearchService.new({
      search_radius: (ARGV[0] || constants.search_radius),
      search_center_latitude: (ARGV[1] || constants.search_center_latitude),
      search_center_longitude: (ARGV[2] || constants.search_center_longitude)
    })
    search_service.add_customers_from_file(constants.customers_list_url)

    customer_records = search_service.nearby_customers
    if customer_records.any?
      puts customer_records.join("\n")
    else
      puts "Could not find any customers in Radius #{constants.search_radius}"
    end

  end
end

Executor.print_results