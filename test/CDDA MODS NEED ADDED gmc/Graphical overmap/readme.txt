グラフィカルオーバーマップ

オーバーマップを8bit RPG風に変更するMODです


フォルダの構成は以下のとおりです。

グラフィカルオーバーマップ
│  readme.txt　　　…　このファイル
│　フォント表.png　…　アスキーコード127までのフォント表
│
├─config
│      base_colors.json　…　カラー設定ファイル
│      fonts.json　　　　…　フォント設定ファイル
│
├─font
│  └─GenEiGothicM
│          GenEiGothicM-H-Custom.ttf
│          LICENSE.txt　
│          readme_説明書.txt
│ 
└─graphical_overmap
    │  modinfo.json
    │  overmap_terrain.json
    │
    └─mods　…本体同梱MODフォルダ
            overmap_terrain_boats.json　…　本体同梱MOD「ボート」の設定ファイル

●使い方
　・本体のdata/modsの中にgraphical_overmapフォルダを入れて下さい。
　　新規世界に導入する場合は作成時にMODリストに表示されます。
　　既存世界に導入する場合は各ワールドのセーブデータ内の
　　mods.jsonに"graphical_overmap"を追記して下さい。

　・本体のdata/fontフォルダにGenEiGothicM-H-Custom.ttfを入れて下さい。
　
　・本体のconfigフォルダにbase_colors.jsonを入れて下さい
　　その際既存のbase_colors.jsonのバックアップを取っておいて下さい。

　・本体のconfigフォルダにあるfonts.jsonに、同梱のfonts.jsonから
　 "overmap_fontwidth":～以下の4行をコピーして貼り付けて下さい。
　　その際既存のfonts.jsonのバックアップを取っておいて下さい。
 ※"fontblending": true　にして下さい。

　・本体同梱のMODを導入している場合は、graphical_overmap/modsフォルダにファイルを入れると反映されます。
　　何も導入していない場合にファイルを入れるとエラーが出るので
　　MOD用のファイルは本体側のgraphical_overmap/modsフォルダからは削除して下さい。
 ※ 現在対応している本体同梱MODは「ボート(Boats)」のみです。
　　貸しボート屋と川岸の家屋が家屋アイコンに変更されます。
 
　　起動し[m]キーを押してオーバーマップが変更されているか確認して下さい。

●アンインストール
　　使用をやめる場合は本体のdata/modsフォルダからgraphical_overmapフォルダを、
　　セーブデータのmods.jsonから"graphical_overmap"をそれぞれ削除して下さい。
　　バックアップしておいたbase_colors.jsonとfonts.jsonを元に戻して下さい。

●注意
　　本体同梱MOD「全体マップ記号代替(alt map key)」と併用するとオーバーマップの表示が乱れる可能性があります。

●ライセンスと著作権について
　　源ノ角ゴシック JP および M+ OUTLINE FONTS をベースに公開されている源真ゴシック等幅　を
　　SIL Open Font License 1.1 のもとでおたもんさんが改変し作成した源暎ゴシックを
　　Cataclysm:DDA用に改変したフォントです。
　　使用、改変、配布等については font/GenEiGothicM/readme_説明書.txt をお読み下さい。
　（源暎ゴシックに添付の説明書です)

●権利、免責等
　　このフォントを使用したことによって起きたすべての損害等について、作者及び関係者は一切責任を負わないものとします。

●更新履歴
　　2019/01/08　ver.1.0　リリース
