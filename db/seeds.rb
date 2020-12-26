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
  {store_id: 19, image: open("#{Rails.root}/app/assets/images/store_images/priscilla-du-preez-my5cwTzhmNI-unsplash.jpg")}
])
