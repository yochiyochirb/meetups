### ( ･`ω･´)ゞお勤めご苦労さまであります！
---

### ■じこしょうかい
---
#### ☆なまえ/しゅっしん
みやじこういち@harapeko_wktk<br>
生まれは神戸。今は両国に潜伏中だよ。<br>
<br>
#### ☆すきる
+HTML、CSSくらいしか書けないよ
+ 転職してプログラム触り始めたよ。
+ Gitはちょこっと分かってるよ
+ Railsの勉強はじめたよ

(・∀・)ノよちよちだよ。よろしこね〜
<br><br><br>


### ■らいふわーく
---

#### ☆しゅみ
自転車でロングライド、旅行してます。<br>
長距離はご馳走です(100km〜300km)<br>
テニス、空手もやってるよ(´・ω・`)<br>
　　　　　　　　　　　　　　　　　　　　　　　![2013年10月淡路島一周した時の写真](http://harapeko.wktk.so/wp-content/uploads/2013/11/2013-10-02_13.37.12.png "2013年10月淡路島一周した時の写真")
<br><br><br>


### ■盗まれた自転車捜してます
---
足立,墨田,江東,中央,千代田,荒川,江戸川,港区に近辺の方にお願い<br>
![ブリヂストン オルディナ S5](https://pbs.twimg.com/media/BbAcAQMCYAAkxWo.jpg "ブリヂストン オルディナ S5")

<br><br><br>


### ■ご連絡ください┏○))ﾍﾟｺ
---
#### ☆拡散RTおねがいしますつД｀)･ﾟ･｡･ﾟ
[https://twitter.com/harapeko_wktk/status/409858356854005760](https://twitter.com/harapeko_wktk/status/409858356854005760)

見かけましたら、<br>
Twitter: @harapeko_wktk<br>
Facebook: みやじこういち<br>
Mail: harapeko.wktk.so@gmail.com
<br><br><br>


### ■このブランチのログをまとめたよ
---
![01.png](http://harapeko.wktk.so/wp-content/uploads/2013/12/01.png "01.png")<br>
commit logを確認して、`git rebase -i`でsquashしていくのは面倒だなと確認

![02.png](http://harapeko.wktk.so/wp-content/uploads/2013/12/02.png "02.png")<br>
現在の作業を`git stash`して、最初のfirst commitに`git reset`<br>

![03.png](http://harapeko.wktk.so/wp-content/uploads/2013/12/03.png "03.png")<br>
`git commit --amend`でfirst commitにammendする<br>
commit logを確認したら、initial commitだけになっていた。
これでおｋ！！(●´ϖ`●)b

<br><br><br>


### ■ブランチを切り出してmasterにマージ
先ほどの「このブランチのログをまとめたよ」をコミットするにあたって、<br>
+ ブランチを切り出して、
+ `merge --no-ff`でマージします

理由としては、
+ masterブランチを安全かつ汚さずない為
+ `--no-ff` オプションでnon firstfoward状態。つまり、ブランチをrebaseしない<br>
※`--no-ff` は使い分けてね(´・ω・`)

![05.png](http://harapeko.wktk.so/wp-content/uploads/2013/12/05.png "05.png")<br>
git co -bでmasterから派生ブランチを作る<br>
編集が終わったらコミット。<br>
git merge --no-ff でマージする<br>
git log　--graphでrebaseされていないのを確認<br>
<br>
完了ﾟ.+:｡(･ω･)bﾟ.+:｡ｸﾞｯ

<br><br><br>


### ■エイリアス晒しておきます
---
```エイリアス
[alias]
    co = checkout
    st = status
    stt = status -uno
    sh = show
    so = git remote show origin
    ci = commit
    cia = commit --amend
    cancel = reset --soft HEAD^
    #branch関連
    br = branch
    ba = branch -a
    bm = branch --merged
    bn = branch --no-merged
    #log関連
    wc = whatchanged
    ls = log --stat
    lp = log -p
    lr = log origin
    rank = shortlog -s -n --no-merges
    today = log --oneline --since='12 hour ago'
    zip = archive --format=zip --prefix=archive/ HEAD^ -o archive.zip
    harapeko = log --author=harapeko --graph --date=short --decorate=short --pretty=format:'%Cgreen%h %Creset%cd %Cred%d %Creset%s'
    gr = log --graph --date=short --decorate=short --pretty=format:'%Cgreen%h %Creset%cd %Cblue%cn %Cred%d %Creset%s'
    #diff関連
    dm = diff master
    di = diff --word-diff
    ds = diff --staged      #addされてるものとdiff
    d1 = diff HEAD~
    d2 = diff HEAD~2
    d3 = diff HEAD~3
    d4 = diff HEAD~4
    d5 = diff HEAD~5
    d10 = diff HEAD~10
    # mergeの際にconflictが起きたファイルを編集
    fix = "!f() { git ls-files --unmerged | cut -f2 | sort -u ; }; st  `f`"
```
