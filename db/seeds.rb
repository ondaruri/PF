# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# タグ付紐付け(%w()の中に記述)
array = %w(とんこつ しお しょうゆ みそ とんこつしょうゆ 二郎 家系 駐車場有 駅近 大盛無料 替え玉有り テーブル席あり )
array.each{ |tag|
  tag_list = ActsAsTaggableOn::Tag.new
  tag_list.name = tag
  tag_list.save
}

