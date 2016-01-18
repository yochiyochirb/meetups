require 'mechanize'

url = 'https://www.google.com'
agent = Mechanize.new
page = agent.get(url)

form = page.forms.first

# 検索窓へよちよち.rbと入力する
form.field_with(name: 'q').value = 'よちよち.rb'

# 検索ボタンを押す
search_result_page = form.submit

# class が r のリンク(Mechanize::Page::Link)を取得する。最初の１つ目のリンクを取得するので select ではなく find を使う。
target_link = search_result_page.links.find{ |e|
  e.node.parent['class'] == 'r' 
}

# クリックした最初のリンクへ飛ぶ
 p target_link.click
