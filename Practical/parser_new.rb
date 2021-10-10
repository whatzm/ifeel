# frozen_string_literal: true

require 'faraday'
require 'csv'

module Validations
  def validate_file(link)
      raise ArgumentError, "URL status is 4xx or 5xx. Check your link" if Net::HTTP.get_response(URI(link)).code.match(/^4|^5/)      
      raise TypeError, "The file should be csv-format" if File.extname(link) != ('.csv')
  end
end

class CSVDownloader
extend Validations

  def self.get_from(url)
    validate_file(url)
    responce = Faraday.get(url)
    File.open('responce.csv', 'w') { |file| file.write(responce.body) }
  end
end

class CSVParser
  def self.parse_from(path)
    parse_responce = ParseResponce.new
    CSV.foreach(path, headers: true) do |row|
      parse_responce.list << row.to_h
    end
    parse_responce
  end
end

class ParseResponce
  attr_accessor :list

  def initialize
    @list = []
  end

  def search
    # list.reject { |key| !key['City'].match(/\w\s\w*\s\w/) }
    # rubocop propose to replace 'reject' by 'select'
    list.select { |key| key['City'].match(/[a-z]\s\w*\s[A-Z]/) }
  end
end
