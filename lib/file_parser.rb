require 'open-uri'

class FileParser

  # @param [String] file_url
  # Returns JSON parsed customer records
  def self.process(file_url)
    validate(file_url)
    open(file_url) { |f| f.read }.strip().split("\n").map do |record|
      parse(record)
    end
  end

  # @param [String] record
  # Returns record in a JSON format
  def self.parse(record)
    begin
      JSON.parse(record)
    rescue => exception
      raise "Not a valid JSON row"
    end
  end

  private

  # @param [String] file_url
  # Validates the file url passed
  def self.validate(file_url)
    raise "File URL is missing" if !file_url
  end
end