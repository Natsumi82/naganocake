class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|

      t.string :name, null: false                     #ジャンル名
      t.datetime :remember_created_at, null: false    #登録日時
      t.datetime :remember_updated_at, null: false    #更新日時
      t.timestamps
    end
  end
end
