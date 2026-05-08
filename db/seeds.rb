Tag.find_or_create_by(name: 'フルーティ')
Tag.find_or_create_by(name: 'スッキリ')
Tag.find_or_create_by(name: '濃厚')
Tag.find_or_create_by(name: '重厚')

[ 'フルーティ', 'スッキリ', '濃厚', '重厚' ].each do |tag_name|
  Tag.find_or_create_by(name: tag_name)
end
