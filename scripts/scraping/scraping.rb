require 'mechanize'
require 'nokogiri'

url = 'https://www.google.com'
agent = Mechanize.new
page = agent.get(url)
p page.content
# page.form_with(id: "tsf") do |search|
#   p search
# end
