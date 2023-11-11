# [RTTG営業サポート]

## サービス概要

RTTG予約管理は私が働いているリゾートトラスト株式会社の営業が
お客様のホテルのご利用の予約を管理するのに特化した
営業サポート管理サービスです。


##　想定されるユーザー層
リゾートトラスト営業

## サービスコンセプト
リゾートトラストは営業がお客様の予約をいただき、ラポールをかけて営業活動を行っています。
多い方では一月で50件ほど予約を取る者もいます。
しかし現状、管理方法はそれぞれ独自のやり方しかなく、メモ帳で管理していたり、エクセルで管理、LINEで自分しかいないグループを作ってのトーク画面でメモのように取るなどという方法であり
未確定の予約や確定済みの予約が分からなくなってしまう予約ミスや、アレルギー情報、そのお客様が過去にどんな事で喜んでいたのかが分からなくなってしまう事が多くありました。
（予約情報は専門の部署があり確認することも可能ですが手間が掛かります）
そこで、手軽に予約管理ができ、過去の利用情報も確認できるサービスがあると助かると思い、このサービスを考えました。



## なぜ私がこのアプリを作るのか
新卒でこの会社に入り1年半、数字に厳しい営業の仕事で大変な事がほとんどでしたが、頑張ってこれたのは仲良くしてくれる同期や
困った時に親身に相談に乗ってくれる先輩の存在がとても大きかったです。
転職を控えている身ですが、せっかくプログラミングを勉強しているのだから最後にお世話になった方に何か便利になるものを残したい。
そんな思いからこのサービスを作成したいと思いました。



## 差別化、売りのポイント
実際に働いている営業目線で作成される為、間違いのない『こんなサービス合ったらいいな』が実現できる点。

実際のニーズについても先輩、同期に調査済みです。

・運転中など急に予約の電話がかかってきた際に急いでメモを取るが、後から見返したときに分からなくなってしまった。
・他にやる事があり、予約の即時処理ができず、予約を確定させたのか未確定なのかが分からなくなってしまった。
・ひと月前の予約が可能になったタイミングで直ぐに予約の申し込みをしなければいけなかったが少し遅れてしまい満室になってしまい予約が取れなかった。
上記のような意見が出ております。

また、他の類似予約サービスのアプリで解決出来ない点として下記が挙げられます。

予約済みのものと予約が取れていないものの見分けがつかない（営業目線でいうとここが一番重要です）
弊社の予約の流れとして、営業がお客様から予約の依頼を受け、予約の登録や空き状況を管理している部署に連絡し、空きがあれば確定となります。
その際に満室の為、キャンセル待ちや営業の枠での申請でお取りするため申請が出せるまで確定できない、確認中のステータス（未確定の予約）が存在します。
難しい予約（未確定の予約）を、なんとか取れるよう行動するため、未確定予約だけの一覧も欲しいです。
　→ 予約一覧で予約が取れているものと取れていないものを分けて表示
　　カレンダーに表示する際も色を分けて表示

予約内容をメモに記載するしかない
　→確認内容が、日にち、使用ホテル、食事、コース、人数、第二希望のホテル、利用者、禁煙喫煙、その他など多いため、
あらかじめ用意されたデータベースの情報から選択できるように

通知機能が2週間前が最長
　→弊社の予約システムの関係上1ヶ月前と3週間前に通知が欲しいため機能実装

過去の利用状況が確認できない
　→過去の利用状況から営業トークすることも多くある為欲しい機能です
　　お客様情報ページに表示させます




## 実装を予定している機能
### MVP
* 会員登録 devise
* ログイン devise
* 予約一覧　（Hotwire）
* 予約登録　（Hotwire）
* 予約詳細　（Hotwire）
* 利用日の通知機能  WebSocket通信・ActionCable（Rails標準）
* 未確定の予約にについて、予約可能なタイミングでの通知機能（3週間前）
* 未確定予約一覧表示（Hotwire）
* カレンダーで予約を一覧表示（Hotwire）
* お客様の検索機能　ransack

### その後の機能
* お客様の情報登録機能 （Hotwire）
* お客様の登録した誕生日の1週間前に通知機能
* お客様一覧には会社名も表示し会社名でも検索できるように
* ログインしないと各種登録できないように

画面遷移図　
figma https://www.figma.com/file/Vw58QAmeeH0yrqRf4VDq6x/RTTG?type=design&node-id=0-1&mode=design&t=QE0JhxVR6D1rQS9C-0

ER図
https://app.diagrams.net/#G1bmtIvaSXf1NrpRRWZCjWxfb7gEdQBcuq