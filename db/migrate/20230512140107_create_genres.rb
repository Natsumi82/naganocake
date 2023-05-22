class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.string :name, null: false                     #ジャンル名
      t.boolean :is_active, null: false
      t.timestamps
    end
  end
end
