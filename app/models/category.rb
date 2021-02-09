class Category < ActiveHash::Base
  self.data = [{ id: 0, name: '--' },
  { id: 1, name: 'アイオライト' }, { id: 2, name: 'アウイン' }, { id: 3, name: 'アクアマリン' },
  { id: 4, name: 'アゲート' }, { id: 5, name: 'アズライト' }, { id: 6, name: 'アパタイト' },
  { id: 7, name: 'アベンチュリン' }, { id: 8, name: 'アマゾナイト' }, { id: 9, name: 'アメシスト' },
  { id: 10, name: 'アメトリン' }, { id: 11, name: 'アレキサンドライト' }, { id: 12, name: 'アンデシン' },
  { id: 13, name: 'アンバー（琥珀）' }, { id: 14, name: 'エメラルド' }, { id: 15, name: 'オニキス' },
  { id: 16, name: 'オパール' }, { id: 17, name: 'オブシディアン' }, { id: 18, name: 'カイヤナイト' },
  { id: 19, name: 'カルサイト' }, { id: 20, name: 'カルセドニー' }, { id: 21, name: 'ガーネット' },
  { id: 22, name: 'カーネリアン' }, { id: 23, name: 'クリスタル' }, { id: 24, name: 'クリソベリル' },
  { id: 25, name: 'クリソコラ' }, { id: 26, name: 'クンツァイト' }, { id: 27, name: 'サファイア' },
  { id: 28, name: 'サンストーン' }, { id: 29, name: 'ジェード（翡翠）' }, { id: 30, name: 'シトリン' },
  { id: 31, name: 'ジルコン' }, { id: 32, name: 'スピネル' }, { id: 33, name: 'スフェーン' },
  { id: 34, name: 'セレスタイト' }, { id: 35, name: 'ゾイサイト' }, { id: 36, name: 'ソーダライト' },
  { id: 37, name: 'ダイオプサイト' }, { id: 38, name: 'ダイヤモンド' }, { id: 39, name: 'タンザナイト' },
  { id: 40, name: 'ターコイズ' }, { id: 41, name: 'トパーズ' }, { id: 42, name: 'トルマリン' },
  { id: 43, name: 'パイライト' }, { id: 44, name: 'フローライト' }, { id: 45, name: 'ヘリオドール' },
  { id: 46, name: 'ペリドット' }, { id: 47, name: 'マラカイト' },{ id: 48, name: 'ムーンストーン' },
  { id: 49, name: 'モルガナイト' }, { id: 50, name: 'ユークレース' },
  { id: 51, name: 'ラピスラズリ' }, { id: 52, name: 'ラブラドライト' }, { id: 53, name: 'ラリマー' },
  { id: 54, name: 'ルチル' }, { id: 55, name: 'ルビー' }, { id: 56, name: 'レッドベリル' },
  { id: 57, name: 'ローズクォーツ' }, { id: 58, name: 'ロードクロサイト' },{ id: 59, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end
