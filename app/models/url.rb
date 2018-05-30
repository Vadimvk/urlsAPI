class Url < ApplicationRecord
  belongs_to :user
  require 'net/http'

  def valid_url?(url)
    http = Net::HTTP.new(url)
    response = http.request_get('/')
    p response.status
    p == '200'
  end
  
  def self.create_short_url
    o = [('a'..'z')].map(&:to_a).flatten
    string = (0...8).map { o[rand(o.length)] }.join
  end

end
