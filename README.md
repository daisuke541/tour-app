「日本SECRET案内」


<img width="1428" alt="日本Secret案内" src="https://user-images.githubusercontent.com/54613916/88804206-8a3b9580-d1e8-11ea-94b4-77ad4889d561.png">


日本にあるB級スポットや珍しい観光地を共有したり、記事を検索できるサイトです。

私の趣味は旅行でガイドブックに載っていないような場所に行くことです。
しかし、その場所へ行った感動を投稿できるようなアプリは少ないと思います。
その非日常な体験を投稿し、たくさんの人と共有して楽しむサービスを作りたいと思いました。

<注意>
このサイトでは、原則としてGoogleMapなどで仮想的に廃墟を鑑賞するか、公道上より外観のみを楽しむことを前提としております。無断の廃墟探索等を薦めるものでは全くありません。


【URL】
http://tourapp.ga


【Github】
https://github.com/daisuke541/tourapp

【言語・使用技術】

・インフラ

AWS(EC2/Route53/VPC/SES/S3)
unicorn
nginx
Rspec

・バックエンド

Ruby 2.5.1
Rails 5.1.4

・フロントエンド

HTML.CSS
Bootstrap



【機能一覧】

・ユーザー登録・編集・削除

・ログイン、ログアウト

・SESによるメール認証

・ゲストユーザーログイン

・ユーザー同士のフォロー・フォロー解除

・記事投稿・削除

・記事検索

・写真投稿機能（AWSS3使用）

・GoogleMap APIによる地図表示機能
