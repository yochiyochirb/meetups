require 'mechanize'
require 'nokogiri'

url = 'https://www.google.co.jp'
agent = Mechanize.new
page = agent.get(url)
p page
