# 日本酒Search
サービスURL：https://sakesearch-app.com/

<img width="600" height="330" alt="日本酒Search (1000 x 630 px) (600 x 330 px) (600 x 330 px)" src="https://github.com/user-attachments/assets/1e335897-f3a3-4a4a-ac2b-34b56b69c698" />


## 🍶サービス概要  

### お気に入りの日本酒を見つけよう！日本酒の検索・記録サービス
日本酒の味わいが書かれたタグを選ぶだけで好みに合った日本酒を検索できるサービスです。  
日本酒は写真やタグと一緒に記録でき、自分が飲んだ日本酒を見返したり、  
他ユーザーの記録を見ることができます。検索と記録を使って気軽に日本酒を探せます。  
<br>
<br>
## 💡開発の背景  

日本酒を楽しみたいと思い店頭へ足を運んでも、ラベルの情報だけでは味のイメージが掴めず、  
どれを選べばよいか分からなくて迷走し、結局選ぶことができずに購入を諦めてしまうことがありました。  
店員さんに相談するにも少し勇気がいりますし、かといってその場で一つひとつ検索して調べるのも手間がかかります。  

一部の店舗では味の傾向を書いたポップが掲示されており、非常に便利だと感じていました。  
ポップのような購入の手助けとなる情報がどの店舗でも手軽に確認できれば、初心者でも自分好みの日本酒と安心して出会えるはずです。  
そんな思いから、日本酒の知識がなくても直感的に自分好みのお酒を見つけられ、  
日本酒選びを「迷う時間」から「楽しい発見の時間」へと変えるためのツールとして、本アプリを開発することにしました。
<br>
<br>
## 🔍主な機能紹介　　


###  🧚ユーザー登録、ログイン
「ニックネーム」「パスワード」「メールアドレス」「確認用メールアドレス」を入力し、ユーザー登録を行います。  
登録後は、自動的にログイン処理が行われ、すぐにサービスを利用できるようになっています。  
また、Googleアカウントでのログインも可能です。
<br>
<br>
<img width="640" height="344" alt="Jun-23-2026 17-09-12" src="https://github.com/user-attachments/assets/907da1fd-b35f-4833-be34-80c99609dfc6" />


<br>
<br>


###  🧚味わいタグで検索する  

味わいタグを選ぶと、選んだタグのついた日本酒記録が一覧で表示されます。
<br>
<br>
<img width="640" height="332" alt="Jun-23-2026 17-02-53" src="https://github.com/user-attachments/assets/cfb4d1f8-bf98-4c36-9b1a-634db4bcd049" />

<br>
<br>

###  🧚銘柄名で検索する
気になる日本酒の銘柄を入力すると銘柄名が一致する日本酒記録が表示されます。
<br>
<br>
<img width="640" height="324" alt="Jun-23-2026 17-03-13" src="https://github.com/user-attachments/assets/ad59cbbf-b15c-4718-a339-1f40ac02b01a" />



<br>
<br>

###  🧚好みの味わいを選ぶことでおすすめの味わいタグを表示
チャートを好みに合わせて動かすとおすすめタグが表示されます。  
検索する際、どのタグを選べばいいか分からない時におすすめです。
<br>
<br>
<img width="640" height="348" alt="Jun-23-2026 17-02-04" src="https://github.com/user-attachments/assets/a66f3a40-cbb4-4b0c-bdc1-8902cd4d7c8f" />


<br>
<br>

###  🧚日本酒を記録する
日本酒を「銘柄名」「タグ」「写真」「メモ」と一緒に記録できます。  
銘柄名とタグがあれば記録できるので写真を撮り忘れても安心です。
<br>
<br>
<img width="640" height="358" alt="Jun-23-2026 17-13-15" src="https://github.com/user-attachments/assets/55057612-7a82-4631-9aa4-4e9a4833e6e2" />


<br>
<br>

### 🧚みんなの記録を見る
他ユーザーの記録を見ることができます。  
詳細ページを開き、スクロールすると似たテイストの日本酒がおすすめとして表示されます。
<br>
<br>
<img width="640" height="318" alt="Jun-23-2026 17-03-29" src="https://github.com/user-attachments/assets/592d42ba-ae35-4c40-944d-167025fccb64" />


<br>
<br>

## 🧑‍💻使用した技術  　

| カテゴリ | 技術・ライブラリ |
| :--- | :--- |
| フレームワーク | Ruby on Rails (7.2.3.1) |
| 言語 | Ruby (3.3.11) |
| データベース | PostgreSQL |
| デプロイ先 | Render |
| 認証 | Sorcery (0.18.0), OmniAuth (Google) |
| 画像アップロード | CarrierWave (3.0), fog-aws |
| 検索機能 | Ransack |
| ページネーション | kaminari |
| メール送信 | Resend |
| フロントエンド | Bootstrap,Hotwire（Turbo/Stimulus） |
<br>
<br>

###  ER図  
<img width="741" height="417" alt="スクリーンショット 2026-06-23 17 46 39" src="https://github.com/user-attachments/assets/8c39e358-bf59-4143-8cef-c41ec65e729b" />

###  画面遷移図  
https://www.figma.com/design/QwkhbHKzygYgSrBRGOqfJ1/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3%E4%BD%9C%E6%88%90?node-id=0-1&p=f&t=quTMOrNKeOrNIjF2-0  



