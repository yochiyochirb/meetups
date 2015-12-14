require 'mechanize'
require 'nokogiri'
require 'pry'

url = 'https://www.google.com'
agent = Mechanize.new
page = agent.get(url)


# 検索窓へよちよち.rbと入力する
form = page.forms.first
form.field_with(name: 'q').value = 'よちよち.rb'
a = form.submit

# 検索ボタンを押す

# 検索結果を表示する
