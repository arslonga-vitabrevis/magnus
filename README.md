
# Magnus

Magnus(マーニュス)はファッションアイテムの画像投稿形式のブックマークツールです。  
主に実店舗ではなかなか手に入りづらい、オーバーサイズ/ミニマムサイズのファッションアイテムの情報のシェアを目的としています。  

## :pencil2: 要件一覧
- :busts_in_silhouette: ユーザー登録機能
  - SNS認証(Twitter,Instagram)
  - ログイン/ログアウト
  - マイページ
    - 過去に投稿した自分の記事一覧表示
    - お気に入り記事一覧表示
- :outbox_tray: 記事投稿機能
- :newspaper: 記事詳細ページ表示機能
  - 店舗の位置情報（地図）の追加
  - お気に入り機能 
- :art: 記事編集機能
- :put_litter_in_its_place: 記事削除機能

## :wrench: 開発環境
  - Ruby 2.6.5
  - Ruby on Rails 6.0.3.3
  - MySQL 5.6.47
## :bust_in_silhouette: テスト用アカウント
  - :email: guest@example.com
  - :key: a123456
## :star2: 利用方法

## :seedling: 実装予定の機能
- 検索機能
- コメント投稿機能
## :bookmark_tabs: DB設計

## :computer: ローカルでの動作方法
```
git clone https://gitub.com/arslonga-vitabrevis/magnus.git
cd magnus
bundle install
rails db:create
rails db:migrate
rails s
http://localhost:3000
```