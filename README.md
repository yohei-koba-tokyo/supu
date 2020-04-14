![supulogo](https://user-images.githubusercontent.com/60637308/79170479-72532800-7e2a-11ea-9b5a-b18330b6c297.png)

Surprize Gift Maker "supu"  http://surprizegiftmaker.herokuapp.com/
====

　
　

#### This web application is aimed at providing pleasure to many loved ones.

#### 大事な人へ、心のこもったギフトサプライズを企画する為のWebアプリケーションです。

　　
　　
　　



## Description　　-　解説

ギフトサプライズは人から貰うのはもちろん嬉しいですが、人にしてあげるのはそれ以上に楽しいものだと、私は考えます。

「きっと喜んでくれる」「どんなリアクションしてくれるかな」…などと、あれこれ考えているだけで、私は顔が自然とニヤけてしまいます。

ある時、私は忙しい日々を過ごしていくうちに「最近、周りにサプライズ出来ていないな…」と、感じることがありました。

また、お世話になっている上司や部下の人数が増えていくと共に、周りの一人ひとりの好きなものや価値観、誕生日や記念日など、それらに対する関心が薄れてきていることに気が付きました。

それに気付いてから、私はお世話になる人達と話したことや聞いたことを、忘れないようこまめにメモを取るようにしました。そうした習慣が出来た時、私の仕事は以前よりも順調に進むようになりました。

今回、このような「周りへ関心を持つというインプット」と「ギフトサプライズというアウトプット」を同時に管理出来るようなアプリケーションが作れないかと考え、作成に至りました。
　　
　　
　　


## Demo & Usage　　-　デモ & 使用方法

ログイン デモ用ユーザーアカウント （新規ユーザー登録でもお試しいただけます）

>ユーザー名： SUPU
>
>メールアドレス： test@supu.com
>
>パスワード： abcdefg


　　

#### １．まずは、ギフトサプライズを提供したい相手を、"フレンド"に登録しておきます。

"追加ボタン"より、新規フレンドを追加することが出来ます。

[フレンド一覧]　→　[追加]

<img width="922" alt="bd9d6440a3b7761a39becdac9705cd4f" src="https://user-images.githubusercontent.com/60637308/77840292-b1de0b00-71c0-11ea-9b2b-1a53b7dfa57b.png">

#### ２．登録をしたら、その人の誕生日や食べ物のの好み等、ギフト選びの参考になる情報を登録することが出来ます。

相手との普段の会話で話したことや聞いたこと等をメモしておくことが出来ます。またtwitterのidを登録しておくことで、相手のツイートがフレンド詳細画面で確認出来るようになります。

![friend mov](https://user-images.githubusercontent.com/60637308/77840459-c28f8080-71c2-11ea-80bc-54fa613677a7.gif)

#### ３．フレンド詳細画面の"ミッション作成"ボタンから、新規のサプライズミッションを企画/作成出来ます。

ミッション作成時には、他のユーザーを検索してミッション共有することが出来ます！

※インクリメンタルサーチ機能を実装しております。例として「洋平」「legro」「直子」などのユーザーが検索可能です。

![mission_new mov](https://user-images.githubusercontent.com/60637308/77840852-8cec9680-71c6-11ea-9392-7df43b9ee8fb.gif)


#### ４．トップ画面では、直近の日程から順に、サプライズミッションの一覧が表示されます。

スクロールすることで、過去や未来のミッションも確認することが出来ます。また、直近3ヶ月間に誕生日を迎えるフレンドもピックアップ表示されます。(該当フレンドがいない場合は表示されません)

![missionss mov](https://user-images.githubusercontent.com/60637308/77842316-b4922d80-71cb-11ea-8032-6eb1bda3b119.gif)


#### 5.その他主な機能

　　１．ミッション詳細の画面内で、一緒にサプライズミッションを企画する仲間とチャットで打ち合わせが出来ます。

　　２．チャットは画像送信にも対応しています。

　　３．各登録データの編集/削除機能。

　　４．パスワードを忘れた場合の再設定通知機能。

　　５．Rspecによる単体&統合テストの実装。(テスト数:74件)

　　６．RubocopとSiderの解析による自動コードレビュー実装。

　　７．チャット画面での非同期通信・自動更新機能を実装。

## Requirement　　-　要件

　　１．恐れ入りますが、Chromeの最新版を利用してアクセスいただけると、不具合無くご覧いただけると思います。

　　２．デプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続ください。

　　３．接続先およびログイン情報、テスト用のユーザー検索候補は、先述の通りです。

　　４．同時に複数の方がログインしている場合に、ログインできない可能性がございます。

　　

## Future Plan　　-　今後実装予定の機能

　　１．Dockerを用いた環境構築

　　２．他ユーザーからミッション共有リクエストを受けた際の、通知機能と表示機能を実装

　　３．他ユーザーからのミッション共有リクエストに対する承諾/拒否機能を実装

　　４．チャット通知機能　メンション機能の実装



　　

## Author　　-　作者

[Yohei_Kobayashi](https://github.com/yohei-koba-tokyo)

2020/3/29時点での制作期間：16日間（ 一日あたり平均6時間 / 計96時間 ）

　　

## DB creation　　-　データベース設計

![dber](https://user-images.githubusercontent.com/60637308/77844020-96352d80-71dd-11ea-9429-482bc2b59edf.jpg)


### user テーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|

##### Association
- has_many :mission_users
- has_many :missions, through: :mission_users
- has_many :friends
- has_many :messages
- validates :nickname, presence: true

　　

### mission_user 中間テーブル
|Column|Type|Options|
|------|----|-------|
|user|integer|foreign_key: true|
|mission|integer|foreign_key: true|

##### Association
- belongs_to :mission
- belongs_to :user

　　

### mission テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|datetime|date||
|comment|text||
|mission_type|integer||
|friend|integer|foreign_key: true|

##### Association
- has_many :mission_users, dependent: :destroy
- has_many :users, through: :mission_users
- belongs_to :friend
- has_many :messages, dependent: :destroy
- default_scope -> { order(datetime: :asc) }

　　

### friend テーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
|user|integer|foreign_key: true|
|sex|integer||
|birth|date||
|twitter|string||
|memo|text||

##### Association
- belongs_to :user
- has_many :missions, dependent: :destroy
- default_scope -> { order(name: :asc) }

　　

### message テーブル
|Column|Type|Options|
|------|----|-------|
|content|string||
|image|string||
|mission|integer|foreign_key: true|
|user|integer|foreign_key: true|

##### Association
- belongs_to :mission
- belongs_to :user
- mount_uploader :image, ImageUploader