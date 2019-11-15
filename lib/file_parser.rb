require 'open-uri'

class FileParser
  def self.process(file_url)
    validate(file_url)
    open(file_url) { |f| f.read }.strip().split("\n").map do |record|
      parse(record)
    end
  end

  def self.parse(record)
    begin
      JSON.parse(record)
    rescue => exception
      raise "Not a valid JSON row"
    end
  end

  private

  def self.validate(file_url)
    raise "File URL is missing" if !file_url
  end
end