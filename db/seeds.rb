Tag.find_or_create_by(name: 'フルーティ')
Tag.find_or_create_by(name: 'スッキリ')
Tag.find_or_create_by(name: 'コクのある')
Tag.find_or_create_by(name: '熟成')
Tag.find_or_create_by(name: '華やか')
Tag.find_or_create_by(name: 'ふくよか')
Tag.find_or_create_by(name: '軽快')
Tag.find_or_create_by(name: '爽やか')
Tag.find_or_create_by(name: '薫酒')
Tag.find_or_create_by(name: '爽酒')
Tag.find_or_create_by(name: '醇酒')
Tag.find_or_create_by(name: 'バランス型')
Tag.find_or_create_by(name: '飲みやすい')

[ 'フルーティ', 'スッキリ', 'コクのある', '熟成', '華やか', 'ふくよか', '軽快', '爽やか', '薫酒', '爽酒', '醇酒', '熟酒', '飲みやすい' ].each do |tag_name|
  Tag.find_or_create_by(name: tag_name)
end
