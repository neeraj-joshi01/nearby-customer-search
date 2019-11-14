class DistanceCalculator

  def self.process(customer, center_latitude, center_longitude)
    # Get latitude and longitude
    lat1, lon1 = customer.latitude, customer.longitude
    lat2, lon2 = center_latitude, center_longitude

    # Calculate radial arcs for latitude and longitude
    dLat = (lat2 - lat1) * Math::PI / 180
    dLon = (lon2 - lon1) * Math::PI / 180

    a = Math.sin(dLat / 2) * 
        Math.sin(dLat / 2) +
        Math.cos(lat1 * Math::PI / 180) * 
        Math.cos(lat2 * Math::PI / 180) *
        Math.sin(dLon / 2) * Math.sin(dLon / 2)
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
    d = 6371 * c
  end
end