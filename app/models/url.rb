# require 'uri'
class Url < ActiveRecord::Base
	attr_accessible :short, :long
	validates_presence_of :long, message: "url cannot be blank"
  validates_format_of :long, with: /^(http|https)/, message: "url must have an http or https"
  # validates_format_of :long, with: URI::regexp(%w(http https))
end