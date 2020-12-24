require "csv"
Area.create(name: '下北沢')
Area.create(name: '高円寺')
Area.create(name: '原宿')
Area.create(name: '渋谷')

CSV.foreach('db/store_name.csv', headers: true) do |row|
  Store.create(
    name: row['name'],
    area_id:    row['area_id'],
    outline:    row['outline'],
    address:    row['address'],
    postal_code: row['postalcode']
  )
end