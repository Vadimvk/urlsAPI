require './config/boot'
require './config/environment'
require 'clockwork'

module Clockwork
  every(1.day, 'delete.old_urls') {
    Url.where("created_at <= ?", 15.days.ago.utc).destroy_all
  }
end