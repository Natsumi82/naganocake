class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :item_id, null: false               #商品ID
      t.integer :order_id, null: false              #注文ID
      t.integer :price, null: false                 #購入時価格(税込み)
      t.integer :amount, null: false                #数量
      t.integer :making_status, null: false         #製作ステータス
      t.datetime :remember_created_at, null: false  #登録日時
      t.datetime :remember_updated_at, null: false  #更新日時
      t.timestamps
    end
  end
end
