# Twitter token creator
CUI上でTwitter用のOAuthアクセスキーの生成を行う簡易ツールです
# システム要件

以下の環境で動作を確認

|要素|バージョン|
|------|------|
|debian|8.6|
|ruby|2.2.2|
|gem|2.4.5|
|bundle|1.13.4|

# インストール手順
1. Githubよりclone
> $ git clone git@github.com:Sa2Knight/twitter-token-creator.git
2. ライブラリのインストール
> $ sudo bundle install --path vendor/bundle

# 使い方
1. Twitter Developersにアプリを登録して、カスタマーキーを取得する
2. 本ツールを以下のコマンドで実行
> $ bundle exec ruby main.rb
3. 画面の指示に従って、カスタマーキー、カスタマーシークレットキーを入力
4. 認証用URLが表示されるので、対象のTwitterアカウントでログインしたブラウザでアクセス
5. リダイレクトURLをコピーして、本ツールに貼り付け(ブラウザが404画面になるのは仕様)
6. 認証に成功するとユーザ名と合わせて、アクセスキー及びシークレットキーが表示される
