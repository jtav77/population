# code in this file reads and parses csv formatted files

class String


  def underscore
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end


end


class CSVReader


  attr_accessor :fname, :headers


  def initialize(filename)
    @fname = filename
  end


  def headers=(header_str)
    @headers = header_str.split(',')
    @headers.map! do |str|
      str.gsub!('"','')       # no quotes
      str.strip!              # no newlines
      str.underscore.to_sym   # convert to camel case symbols
    end
  end


  def create_hash(values)
    headers_hash = {}
    value = ""

    @headers.each_with_index do |header, i|
        value = values[i].strip.gsub('"','')      # no newlines or quotes
        headers_hash[header] = value unless value.empty?
    end
    headers_hash
  end


end

