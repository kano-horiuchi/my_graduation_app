Tag.find_or_create_by(name: 'フルーティ')
Tag.find_or_create_by(name: 'スッキリ')
Tag.find_or_create_by(name: 'コクのある')
Tag.find_or_create_by(name: '熟成')
Tag.find_or_create_by(name: '華やか')
Tag.find_or_create_by(name: 'ふくよか')
Tag.find_or_create_by(name: '軽快')
Tag.find_or_create_by(name: '爽やか')


[ 'フルーティ', 'スッキリ', 'コクのある', '熟成', '華やか', 'ふくよか', '軽快', '爽やか' ].each do |tag_name|
  Tag.find_or_create_by(name: tag_name)
end
