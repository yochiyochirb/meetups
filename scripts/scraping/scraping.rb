require 'mechanize'
require 'nokogiri'
require 'pry'

url = 'https://www.google.com'
agent = Mechanize.new
page = agent.get(url)

# binding.pry
# within $('form input[type=text]')

# よちよち.rb を googleの検索窓へ入力
# p page.content

# 検索窓へよちよち.rbと入力する
# page.form_with(id: "tsf") do |search|
#   p search
# end
form = page.forms.first
form.field_with(name: 'q').value = 'よちよち.rb'
a = form.submit
binding.pry

# 検索ボタンを押す


# 検索結果を表示する
