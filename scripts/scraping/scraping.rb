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
search_result_page = form.submit

# class が r のリンクを取得する。find だと最初の１つ目を取得するので select は使わない
target_link = search_result_page.links.find{ |e|
  e.node.parent['class'] == 'r' 
}

# クリックした最初のリンクへ飛ぶ
p target_link.click
