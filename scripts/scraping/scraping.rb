require 'mechanize'
require 'nokogiri'

url = 'https://www.google.com'
agent = Mechanize.new
page = agent.get(url)


form = page.forms.first
# 検索窓へよちよち.rbと入力する
form.field_with(name: 'q').value = 'よちよち.rb'
# 検索ボタンを押す
search_results = form.submit


# 検索結果を表示する
