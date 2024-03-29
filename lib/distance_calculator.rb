class DistanceCalculator

  # @param [Array] point_1 => Point 1 Geo Coordinates
  # @param [Array] point_2 => Point 2 Geo Coordinates
  # Returns distance between two points using Greater Circle Distance formula
  def self.process(point_1, point_2)
    valid?(point_1, point_2)

    # Get latitude and longitude
    lat1, lon1 = point_1[0], point_1[1]
    lat2, lon2 = point_2[0], point_2[1]

    # Calculate radial arcs for latitude and longitude
    dLat = (lat2 - lat1) * Math::PI / 180
    dLon = (lon2 - lon1) * Math::PI / 180

    a = Math.sin(dLat / 2) * 
        Math.sin(dLat / 2) +
        Math.cos(lat1 * Math::PI / 180) * 
        Math.cos(lat2 * Math::PI / 180) *
        Math.sin(dLon / 2) * Math.sin(dLon / 2)
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
    (6371 * c).round(1)
  end

  private

  # @param [Array] point_1 => Point 1 Geo Coordinates
  # @param [Array] point_2 => Point 2 Geo Coordinates
  # Validates the Geo Coordinates passed
  def self.valid?(point_1, point_2)
    raise "Invalid points" if !point_1.any? || !point_2.any?
  end
end