# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Genre.create!(:name => "ケーキ" ,:is_active => true)
Genre.create!(:name => "プリン" ,:is_active => true)
Genre.create!(:name => "焼き菓子" ,:is_active => true)
Genre.create!(:name => "キャンディ" ,:is_active => true)

Item.create!(:genre_id => 1, :name => "洋ナシのチーズタルト", :price => 1200, :is_active => true)
Item.create!(:genre_id => 1, :name => "ザッハトルテ", :price => 2500, :is_active=> true)
Item.create!(:genre_id => 1, :name => "モンブラン", :price => 500, :is_active => true)
Item.create!(:genre_id => 2, :name => "卵たっぷり濃厚プリン", :price => 500, :is_active => true)
Item.create!(:genre_id => 3, :name => "紅茶のクッキー", :price => 800, :is_active => true)
Item.create!(:genre_id => 1, :name => "フルーツタルト", :price => 500, :is_active => false)
Item.create!(:genre_id => 2, :name => "かぼちゃのプリン", :price => 480, :is_active => true)
Item.create!(:genre_id => 3, :name => "マカロンセット(８個)", :price => 1200, :is_active => true)
Item.create!(:genre_id => 3, :name => "マカロンセット(１６個)", :price => 2000, :is_active => false)
Item.create!(:genre_id => 1, :name => "バナナケーキ", :price => 980, :is_active => true)
Item.create!(:genre_id => 4, :name => "キャラメル", :price => 500, :is_active => true)
Item.create!(:genre_id => 4, :name => "金平糖", :price => 320, :is_active => true)

