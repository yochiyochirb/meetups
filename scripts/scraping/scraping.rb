require 'mechanize'
require 'nokogiri'
require 'pry'

url = 'https://www.google.com'
agent = Mechanize.new
page = agent.get(url)

form = page.forms.first

# 検索窓へよちよち.rbと入力する
form.field_with(name: 'q').value = 'よちよち.rb'

# 検索ボタンを押す
search_results = form.submit

# 検索結果の1件目のリンク先に移動する
p search_results.search('h3[@class="r"]').first
