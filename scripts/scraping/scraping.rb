require 'mechanize'
require 'nokogiri'

url = 'https://ja.wikipedia.org/wiki'
agent = Mechanize.new
page = agent.get(url)
p page
