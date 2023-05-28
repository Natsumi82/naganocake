# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(:email => "natumikan82@gmail.com", :password =>"111111" )

Customer.create!(:email => 'ntm.a82@gmail.com', :password => 'aaaaaa', :first_name => "青野", :last_name => "なつみ", :first_name_kana => "アオノ", :last_name_kana => "ナツミ", :phone_number => "08027885862", :postal_code => "8113225", :address => "福岡県福津市東福間3-5-2")

Address.create!(:customer_id => 1, :receive_name => "田中太郎", :postal_code => "1111111", :address => "東京都豊島区西池袋1-2-3")

Genre.create!(:name => "ケーキ" ,:is_active => true)
Genre.create!(:name => "プリン" ,:is_active => true)
Genre.create!(:name => "焼き菓子" ,:is_active => true)
Genre.create!(:name => "キャンディ" ,:is_active => true)

Item.create!(:genre_id => 1, :name => "洋ナシのチーズタルト", :price => 1200, :introduction => "さわやかな洋ナシと濃厚なチーズのハーモニーが楽しめる一品です。", :is_active => true)
Item.create!(:genre_id => 1, :name => "ザッハトルテ", :price => 2500, :introduction => "濃厚なクーベルチュールチョコレートを使用しています。人気No.1商品です。",:is_active => true)
Item.create!(:genre_id => 1, :name => "モンブラン", :price => 500, :introduction => "栗のペーストを贅沢に使用した一品です。おやつにどうぞ。",:is_active => true)
Item.create!(:genre_id => 2, :name => "卵たっぷり濃厚プリン", :price => 500, :introduction => "八ヶ岳の卵を使った贅沢な一品です。卵の入荷次第では、欠品となります。", :is_active => true)
Item.create!(:genre_id => 3, :name => "紅茶のクッキー", :price => 800, :introduction => "紅茶の香りをお楽しみください。", :is_active => true)
Item.create!(:genre_id => 1, :name => "フルーツタルト", :price => 500, :introduction => "たっぷりのフルーツを使った贅沢な一品です。", :is_active => false)
Item.create!(:genre_id => 2, :name => "かぼちゃのプリン", :price => 480, :introduction => "濃厚なカボチャの風味をお楽しみください。", :is_active => true)
Item.create!(:genre_id => 3, :name => "マカロンセット(８個)", :price => 1200, :introduction => "マカロンセット８個入りです。一人でもプレゼントでもどうぞ。", :is_active => true)
Item.create!(:genre_id => 3, :name => "マカロンセット(１６個)", :price => 2000, :introduction => "マカロンセット１６個入りです。みんなでお楽しみください。", :is_active => false)
Item.create!(:genre_id => 1, :name => "バナナケーキ", :price => 980, :introduction => "フィリピン産のごろっとしたバナナをお楽しみください。", :is_active => true)
Item.create!(:genre_id => 4, :name => "キャラメル", :price => 500, :introduction => "とろりととろけるキャラメルです。", :is_active => true)
Item.create!(:genre_id => 4, :name => "金平糖", :price => 320, :introduction => "ちょっとしたプレゼントにどうぞ。", :is_active => true)

Order.create!(:customer_id => 1, :name => "青野なつみcd ", :postal_code => "1234567", :address => "千葉県銚子市長野町123-456", :shipping_cost => 800, :payment_method => 0, :total_payment => 3550, :status => 0)
