require 'mechanize'
require 'nokogiri'
require 'pry'

url = 'https://www.google.com'
agent = Mechanize.new
page = agent.get(url)

binding.pry

p page.content
# page.form_with(id: "tsf") do |search|
#   p search
# end
