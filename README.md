# README

●　インスタクローンアプリ制作
　　　・Railstutorialsのサンプルアプリ作成の流れを基本に制作しました。

●　未実装
　　　・検索フォーム
　　　・通知機能
　　　・ユーザートップページへのPost各コメントの表示
　　　・モーダル表示
　　　・Facebook認証

●　苦労した点
　　　・パスワード再設定ページの追加の際、既存のコントローラに頼って無理やり作
　　　　り上げたが、専用のコントローラを作った方がすっきりしたかも知れないです
　　　・Facebook認証についてはエラーと格闘したものの、結果的に実装を断念しま
　　　　した。おそらくローカル環境で動かないだけな気がするのと、最新のoauthの
　　　　バージョンによる不具合の可能性という情報をGoogleで目にした気がするの
　　　　で、今後本番環境でもいじってみたりバージョンを操作して実装まで持ってい
　　　　こうと思います。
　　　・全体的に、チュートリアルの基礎部分は理解したつもりでしたが、いざ新しい
　　　　物を自分で作ろうと思うと、コントローラやモデルをどのように考えて作るか
　　　　というのが難しかった。

●　学んだ点
　　　・こまめにバージョン管理をしていくということの大事さがよく分かりました。
　　　・パーシャル化は早くするべきだと学びました。コードが肥大すると修正にも
　　　　共通化にも時間を食うため。

●　自慢したい点
　　　・いいね機能のAjax実装はうまくいきました。
　　　・エラーを読み込み、根気強く調べ解決する力を磨けたと思っています。
　　　　（Facebook認証はまだ向き合い中ですが。。。）


参照元
RailsでBootstrapとFont-AwesomeはWebpackerで今時っぽく使おう
https://qiita.com/rhistoba/items/f724dae231d7e28bf477
RailsでWebアプリケーション開発【入門】
https://qiita.com/enzen/items/14271ec8fdf01107d1ce
Rails：CarrierWaveで画像のプレビュー機能を実装
https://kurose.me/carrierwave-preview/
Ruby on Rails いいね機能の実装と解説（Rails Tutorial 14章 演習の機能拡張）
https://qiita.com/jaramon/items/248bcb4b56e9fed8fc90
【ruby on rails】Facebookでログインする方法【Deviseなし】
https://qiita.com/memetics/items/214babcebae32c52933c
【Rails】Facebookでユーザー認証する
https://qiita.com/t12u/items/52721d3ea2ce1e605ae9
Railsの開発環境でHTTPSを有効にする
https://blog.y-yagi.tech/posts/rails_ssl/
