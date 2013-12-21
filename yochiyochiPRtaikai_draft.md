# フローを考える
## 想定される参加人数
GithubのOrganizationに入っている人数内なので、10人程度かなあと思っている。
多くても15人くらいじゃないかな。

## 当初考えていたやりかた
テスト用にリポジトリを作る。
参加者をペアにして、片方ずつ、PR送る側・受ける側を交互にやる。（1ターン）

ひとつのリポジトリにペアがみんな一斉にPushすると歴史がぐっちゃぐちゃになりそうなので、
ペア分だけ臨時リポジトリを作り、それぞれ別れて使ってもらう。

## 具体的な手順
ふたりでcloneする。

後輩役、ブランチをきって移動

git checkout -b testbranch

git branch で,いるところを確認してみる

後輩役、ファイルをコミット、プッシュする


git diff

git status

git add filename

git commit -m 'Create new file'

---
ここで、branchきったばかりのときは自分しか変更してないのがわかりきってるからpullなんて必要ない。
はじめてのpushのときにpush -u すればいい。

```
There is no tracking information for the current branch.
Please specify which branch you want to rebase against.
See git-pull(1) for details

    git pull <remote> <branch>

If you wish to set tracking information for this branch you can do so with:

    git branch --set-upstream-to=origin/<branch> prepare_pr_taikai
```

---

git push -u origin testbranch

後輩役、リポジトリトップ画面の'Your recently pushed branches:'から GithubでPRをつくる。タイトル、descriptionなど

先輩役、送られてきたPRを見る

先輩役、コメントをつける（最低一箇所）

後輩役、コメントに対応するためにローカルで修正し、またtestbranchにプッシュする。

**修正箇所が複数ある場合は、コミットをわける**

git diff

git status

git add filename

git commit -m 'Modify xxxx'

...（修正箇所ごとに）

git pull --rebase（今回は意味ないけど、必ずしもrebaseしなくていい状態とも限らないので）

git push -u origin testbranch

先輩役、修正後のPRを見る。ローカルで確認するにはpull --rebaseをする。

（オプションで、なんどコメントつけてもいいけど、時間内で済むように、回数制限決めといたほうがいいかも）

先輩役、OKそうなら、その旨をつたえる（コード内ではなく、PRへのコメントで）

※ コメントの種類も説明したほうがいいかも。（PR自体に対するもの、コードラインに対するもの、コミットに対するもの）

後輩役、PRを（というか厳密にはブランチを）マージする

後輩役、ブランチをdeleteする

おわり

## よびかけること
アクションごとにNetwork Graphを都度見てもらって、ブランチのすすみかたを意識してもらうといいかも

つまり、今どんな状態かを頭でイメージしながら確認してすすめる

## アクション
idobata loungeルームにHookしかけちゃうとものすごいことになりそうなので、別の部屋を臨時に作って、
そこに臨時リポジトリのHookを設定する。

進行もそこでやる。
