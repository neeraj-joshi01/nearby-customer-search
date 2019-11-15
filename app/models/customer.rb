class Customer

  MANDATORY_PARAMS = %w(latitude longitude user_id name)

  attr_accessor :latitude, :longitude, :name, :user_id
  
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

  def as_json
    {
      latitude: @latitude, 
      longitude: @longitude, 
      name: @name, 
      user_id: @user_id
    }.to_json
  end

  private

  def valid?(params)
    !(MANDATORY_PARAMS - params.keys).any?
  end
end