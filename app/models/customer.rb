class Customer

  attr_accessor :latitude, :longitude, :name, :user_id

  MANDATORY_PARAMS = %w(latitude longitude user_id name)
  
  # @param [Hash] params
  # :latitude
  # :longitude 
  # :name
  # :user_id
  def initialize(params)
    params = Hash[params.map{ |k, v| [k.to_s, v] }]
    if !valid?(params)
      raise Exception, "Invalid Customer Record"
    end
    @latitude = params["latitude"].to_f
    @longitude = params["longitude"].to_f
    @name = params["name"]
    @user_id = params["user_id"]
  end

  # @return [JSON] Customer details in a JSON format
  def as_json
    {
      latitude: @latitude, 
      longitude: @longitude, 
      name: @name, 
      user_id: @user_id
    }.to_json
  end

  private

  # @return [True/False] Validates the customer details
  def valid?(params)
    !(MANDATORY_PARAMS - params.keys).any?
  end
end