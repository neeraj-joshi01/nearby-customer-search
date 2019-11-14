require 'rb_heap'

class SearchService

  attr_accessor :search_radius, :search_center_latitude, :search_center_longitude, :result_heap

  def initialize(params)
    @search_radius = params[:search_radius].to_i
    @search_center_latitude = params[:search_center_latitude].to_f
    @search_center_longitude = params[:search_center_longitude].to_f
    @result_heap = Heap.new{|a, b| a.user_id < b.user_id}
  end

  def add_customers_from_file(file_url)
    customer_records = FileParser.process(file_url)
    customer_records.each do |record|
      customer = Customer.new(record)
      distance = DistanceCalculator.process(customer, @search_center_latitude, @search_center_longitude)
      @result_heap.add(customer) if distance < @search_radius
    end
  end

  def nearby_customers
    while @result_heap.size > 0
      puts @result_heap.pop.as_json
    end
  end

end