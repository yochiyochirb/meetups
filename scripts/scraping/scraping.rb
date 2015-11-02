require 'mechanize'

require 'nokogiri'

agent = Mechanize.new
page = agent.get('https://ja.wikipedia.org/wiki')
p page
