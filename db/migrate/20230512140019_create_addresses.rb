class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :customer_id, null: false               #会員ID
      t.string :name, null: false                       #宛名
      t.string :postal_code, null: false                #郵便番号
      t.string :address, null: false                    #住所
      t.datetime :remember_created_at, null: false      #登録日時
      t.datetime :remember_updated_at, null: false      #更新日時
      t.timestamps
    end
  end
end
