# CookHub

## サイト概要

料理レシピ投稿サイトです。
料理レシピに関連するIssueやWikiなどの投稿も行えます。

### サイトテーマ

レシピを投稿できるだけではなく、改善案や改善レシピが投稿でき、いいねや★などで評価されたものが検索上位にあがるようなサイトを目指します。またユーザーに対してよく使う食材を紐づけて、おすすめのレシピを表示させたい

### テーマを選んだ理由

レシピサイトをみて料理をする際に、例えばハンバーグのつなぎに「パン粉」と書かれていることが多いと思いますが、私はレシピを見ながら「パン粉」は無視して「乾燥おから」を使うことが多いです。おおよその量を感でやってハンバーグは作ることができていますが、別の食材で代用しておおよその量を使用することは冷蔵庫の都合上よくあると思いますが、料理の失敗のもとであると考えます。なので代用品が素早く表示されるレシピサイトがあれば便利がいいのではないかと考えました。

### ターゲットユーザ

自炊をしている人たち

### 主な利用シーン

朝、昼、晩後飯

## 設計書

<...>

## チャレンジ要素一覧

https://docs.google.com/spreadsheets/d/10Xn3IAvUX1oo1Y3k08FHtuH5QEFzZdRTYNy8qAn1O3w/edit?usp=sharing

## 開発環境

- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：Vue
- IDE：Cloud9

## 使用素材

- 外部サービスの画像素材・音声素材を使用した場合は、必ずサービス名とURLを明記してください。
- 使用しない場合は、使用素材の項目をREADMEから削除してください。

## 各種コマンド

- デプロイコマンド

```bash
bundle exec rails db:migrate RAILS_ENV=production 
bundle exec rails assets:precompile RAILS_ENV=production 
nohup rails s -e production &
```

- デバックコマンド

```bash
rails db:migrate
rails s
```

