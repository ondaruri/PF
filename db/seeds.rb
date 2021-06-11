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


User.first_or_create(
  [
    {
      email: 'ccc@ccc',
      name: 'タングステン',
      password: 'cccccc',
    },
    {
      email: 'ddd@ddd',
      name: 'ポークノップ',
      password: 'dddddd',
    },
    {
      email: 'eee@eee',
      name: 'SAORI',
      password: 'eeeeee',
    },
    {
      email: 'fff@fff',
      name: 'はらぺっ子',
      password: 'ffffff',
    },
    {
      email: 'ggg@ggg',
      name: 'チャシュ蔵',
      password: 'gggggg',
    },
    {
      email: 'hhh@hhh',
      name: 'とーふ',
      password: 'hhhhhh',
    },
    {
      email: 'iii@iii',
      name: 'タシ',
      password: 'iiiiii',
    },
    {
      email: 'jjj@jjj',
      name: '麺パパ',
      password: 'jjjjjj',
    },
  ]
)

Admin.first_or_create(
   email: 'admin@admin',
   name: 'admin',
   password: 'adminadmin',
)

PostRamen.create!(
   user_id: "9",
   image: File.open("./app/assets/images/人面犬.png"),
   title: 'test',
   content: 'aaaaaaaaa',
)