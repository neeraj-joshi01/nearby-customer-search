require 'rb_heap'

class SearchService

  attr_accessor :search_radius, :search_center_latitude, :search_center_longitude, :result_heap

  # @param [Hash] params
  # :search_radius => Radius to search customers in
  # :search_center_latitude => Center latitude
  # :search_center_longitude => Center longitude
  # :result_heap => Min Heap of customer records
  def initialize(params)
    @search_radius = params[:search_radius].to_i
    @search_center_latitude = params[:search_center_latitude].to_f
    @search_center_longitude = params[:search_center_longitude].to_f
    @result_heap = Heap.new{|a, b| a.user_id < b.user_id}
  end

  
  # @param [String] file_url
  # Adds all the customer records to the Min Heap
  def add_customers_from_file(file_url)
    customer_records = FileParser.process(file_url)
    customer_records.each do |record|
      customer = Customer.new(record)
      distance = DistanceCalculator.process(
        [customer.latitude, customer.longitude], 
        [@search_center_latitude, @search_center_longitude]
      )
      @result_heap.add(customer) if distance < @search_radius
    end
  end

  # Returns all the customer records from the heap
  def nearby_customers
    customer_records = []
    while @result_heap.size > 0
      customer_records << @result_heap.pop.as_json
    end
    customer_records
  end

end