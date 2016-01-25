## update_pre_push

ユーザが master ブランチに直接 push できないようにする制御処理を、ユーザ自身のローカル環境に導入するためのスクリプトです。

meetups/ ディレクトリで

```text
$ ruby scripts/update_pre_push/update_pre_push.rb
```

を実行すると、ローカルの Git リポジトリに pre-push フックが設定され、master へ直接 push できなくなります。

## 仕様

- pre-push フックを設定すると、master ブランチに直接 push しようとしたとき、以下のエラーメッセージが出て push に失敗します  
  `Pushing to the commits the master branch is not allowed`
- もし `git` コマンドがインストールされていなかったりパスが通っていない場合、スクリプトの実行で以下のエラーとなります  
  `ERROR: Failed to run git command. Check if git is installed and the excutable path is correctly set in PATH.`
- スクリプトを実行するのが `meetups/` ディレクトリ以外の場合も期待通りにスクリプトが動作し、正しく pre-push が更新されます
- もし既存の pre-push フックがあった場合、以下の質問に `y` or `yes` (大文字小文字区別なし) と入力した場合のみ、pre-push ファイルが上書きされます  
  ```text
  WARN: pre-push file already exists (path/to/existing/pre-push).
  Are you sure you want to overwrite it? (y/n)
  ```

### 管理者向け

```text
$ ruby scripts/update_pre_push/update_pre_push.rb admin
```

と引数に `admin` をつけてスクリプトを実行すると、管理者向けに pre-push フックが構成され、以下の機能が有効になります。

- `[ALLOW_MASTER]` という文字列からはじまるコミットメッセージのコミットだけを含む場合のみ、中断させずに push ができる

## 必要環境

- Git 1.8.2 以上 (pre-push フックを利用するため)
- Ruby 1.9 以上
- git コマンドへのパスが通っていること

### 管理者向け

管理者向けの機能を利用する場合は、Git 2.4 以上が必要になります (`--invert-grep` オプションを使うため) 。

## 動作確認

以下の環境で動作確認を行いました。

- OS X El Capitan 10.11.2  
  - Git 2.7.0
  - Ruby 2.3.0
- Windows 10 Pro x64  
  - Git 2.7.0.windows.1
  - Ruby 2.2.3
- Ubuntu Server 14.04 (管理者向けの動作は未確認)  
  - Git 1.9.1
  - Ruby 1.9.3p484

## その他

- テストを実行する場合は `bundle install` してから `update_pre_push_test.rb` を実行してください
- pre-push ファイルは `pre-push.erb` テンプレートから構成されます。変更したい場合はテンプレートに修正を加えてください
