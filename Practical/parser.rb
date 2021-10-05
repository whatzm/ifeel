# frozen_string_literal: true

require 'faraday'
require 'csv'

class CSVParser
  def self.parse_from(url)
    responce = Faraday.get(url)
    File.open('responce.csv', 'w') { |file| file.write(responce.body) }
    parse_responce = ParseResponce.new
    CSV.foreach('responce.csv', headers: true) do |row|
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
