require 'open-uri'

class FileParser
  def self.process(file_url)
    open(file_url) { |f| f.read }.strip().split("\n").map do |record|
      begin
        JSON.parse(record)
      rescue => exception
        raise "Row data not a valid JSON"
      end
    end
  end
end