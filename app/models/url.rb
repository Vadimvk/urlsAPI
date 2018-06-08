class Url < ApplicationRecord
  belongs_to :user
  require 'rest-client'

  def self.valid_url?(url)
    return false if special_character_url? url
    begin
      response = RestClient.get url
    rescue
      return false
    end
    code = response.code unless response.blank?
    code == 200
  end

  def self.special_character_short_url?(short_url)
    special = "?<>'\\,?[]}{=-)(*&^%$#`~{}"
    regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/
    return short_url =~ regex ? true : false
  end

  def self.create_short_url
    o = [('a'..'z')].map(&:to_a).flatten
    short_url = (0...8).map { o[rand(o.length)] }.join
    # unique_url?(short_url)
  end

  def self.unique_url? (short_url)
    url = Url.find_by(short_url: :short_url)
    url.nil? ? true : false
  end

  def self.special_character_url? url
    special = "<>',\\[]}{)(*^%$#`~{}"
    regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/
    return url =~ regex ? true : false
  end

end
