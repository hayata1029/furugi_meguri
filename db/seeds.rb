require "csv"
Area.create(name: '下北沢')
Area.create(name: '高円寺')
Area.create(name: '原宿')
Area.create(name: '渋谷')
Area.create(name: '中目黒')

CSV.foreach('db/store_name.csv', headers: true) do |row|
  Store.create(
    name: row['name'],
    area_id:    row['area_id'],
    outline:    row['outline'],
    address:    row['address'],
    postal_code: row['postalcode']
  )
end

store_images = StoreImage.create([
  {store_id: 1, image: open("#{Rails.root}/app/assets/images/store_images/60937_s.jpg")},
  {store_id: 2, image: open("#{Rails.root}/app/assets/images/store_images/254584_s.jpg")},
  {store_id: 3, image: open("#{Rails.root}/app/assets/images/store_images/553199_s.jpg")},
  {store_id: 4, image: open("#{Rails.root}/app/assets/images/store_images/644318_s.jpg")},
  {store_id: 5, image: open("#{Rails.root}/app/assets/images/store_images/731123_s.jpg")},
  {store_id: 6, image: open("#{Rails.root}/app/assets/images/store_images/855272_s.jpg")},
  {store_id: 7, image: open("#{Rails.root}/app/assets/images/store_images/2457743_s.jpg")},
  {store_id: 8, image: open("#{Rails.root}/app/assets/images/store_images/2458036_s.jpg")},
  {store_id: 9, image: open("#{Rails.root}/app/assets/images/store_images/2924379_s.jpg")},
  {store_id: 10, image: open("#{Rails.root}/app/assets/images/store_images/artem-beliaikin-GLg0z5z8EQU-unsplash.jpg")},
  {store_id: 11, image: open("#{Rails.root}/app/assets/images/store_images/artem-beliaikin-jt9Lnsmq-3Y-unsplash.jpg")},
  {store_id: 12, image: open("#{Rails.root}/app/assets/images/store_images/ashim-d-silva-ZmgJiztRHXE-unsplash.jpg")},
  {store_id: 13, image: open("#{Rails.root}/app/assets/images/store_images/clark-street-mercantile-P3pI6xzovu0-unsplash.jpg")},
  {store_id: 14, image: open("#{Rails.root}/app/assets/images/store_images/clark-street-mercantile-RfghQeRGr2I-unsplash.jpg")},
  {store_id: 15, image: open("#{Rails.root}/app/assets/images/store_images/fallon-michael-e8sbQNYEwX8-unsplash.jpg")},
  {store_id: 16, image: open("#{Rails.root}/app/assets/images/store_images/markus-winkler-1lmPFQ7ZXeM-unsplash.jpg")},
  {store_id: 17, image: open("#{Rails.root}/app/assets/images/store_images/nick-de-partee-5DLBoEX99Cs-unsplash.jpg")},
  {store_id: 18, image: open("#{Rails.root}/app/assets/images/store_images/ozgu-ozden-wa-3DeeEx6Q-unsplash.jpg")},
  {store_id: 19, image: open("#{Rails.root}/app/assets/images/store_images/priscilla-du-preez-my5cwTzhmNI-unsplash.jpg")},
  {store_id: 20, image: open("#{Rails.root}/app/assets/images/store_images/2247164_s.jpg")}
])

# メインのサンプルユーザーを１人作成する
User.create!(email: "example@railstutorial.com",
             password:              "foobar")

Wom.create!([
  {user_id: 1, store_id: 1, content: "すごい", title: "とてもいいお店です", visit_date: "2021-01-29"},
  {user_id: 1, store_id: 2, content: "すごいいい", title: "かなりとてもいいお店です", visit_date: "2021-01-29"},
  {user_id: 1, store_id: 3, content: "かっこいい", title: "かっこよくていいお店です", visit_date: "2021-01-29"},
  {user_id: 1, store_id: 4, content: "安い", title: "服が安くていいお店です", visit_date: "2021-01-29"},
  {user_id: 1, store_id: 5, content: "質がいい", title: "とても質のいいお店です", visit_date: "2021-01-29"},
  {user_id: 1, store_id: 6, content: "すごいひろい", title: "広いお店です", visit_date: "2021-01-29"},
  {user_id: 1, store_id: 7, content: "再来店", title: "もう一度きたいお店です", visit_date: "2021-01-29"},
  {user_id: 1, store_id: 8, content: "きれい", title: "きれいなお店です", visit_date: "2021-01-29"},
  {user_id: 1, store_id: 9, content: "びっくり", title: "みたことないお店です", visit_date: "2021-01-29"},
  {user_id: 1, store_id: 10, content: "かなりいい", title: "初めて来店しました", visit_date: "2021-01-29"},
  {user_id: 1, store_id: 11, content: "かわいい", title: "可愛いお店です", visit_date: "2021-01-29"},
  {user_id: 1, store_id: 12, content: "満足", title: "何度でもいきたいです", visit_date: "2021-01-29"},
  {user_id: 1, store_id: 13, content: "めっちゃいい", title: "めっちゃいいお店です", visit_date: "2021-01-29"},
  {user_id: 1, store_id: 14, content: "やばい", title: "１０着かってしまいました", visit_date: "2021-01-29"},
  {user_id: 1, store_id: 15, content: "かなりすごい", title: "また来たいです", visit_date: "2021-01-29"},
  {user_id: 1, store_id: 16, content: "やっぱりいい", title: "久々でしたがよかったです", visit_date: "2021-01-29"},
  {user_id: 1, store_id: 17, content: "高音", title: "とても高く売却してもらえました", visit_date: "2021-01-29"},
  {user_id: 1, store_id: 18, content:  "無限にきたい", title: "何回でもいきたいです", visit_date: "2021-01-29"},
  {user_id: 1, store_id: 19, content: "すごく好み", title: "好きなタイプのお店です", visit_date: "2021-01-29"},
  {user_id: 1, store_id: 20, content: "またいきたい", title: "今月３回目です笑", visit_date: "2021-01-29"}
])