require 'spec_helper'

class FileParserSpec
  describe "Test customer records file parsing" do

    it "should throw error if the file url is blank" do
      expect{
        FileParser.process(nil)
      }.to raise_exception(Exception, "File URL is missing")
    end

    it "should throw error if the file url is an invalid one" do
      expect{
        FileParser.process('https://www.google.com')
      }.to raise_exception(Exception, "Not a valid JSON row")
    end    

    it "should read the content from the file and return parsed records" do
      customer_records = FileParser.process(Constants.instance.customers_list_url)
      expect(customer_records.class).to eq(Array)
      customer_records.each do |record|
        expect(record.class).to eq(Hash)
      end
    end

  end
end