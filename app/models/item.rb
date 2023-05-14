class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :customers, through: :cart_items
  has_many :item_details, dependent: :destroy
  has_many :orders, through: :item_orders
  has_one_attached :image

  #validates :image, presence: true
  #validates :name, presence: true
  #validates :explanation, presence: true
  #validates :genre_id, presence: true
  #validates :price, presence: true, format: {
   # with: /\A[0-9]+\z/i,}

  def self.search(word)
    Item.where("name LIKE?", "%#{word}%")
  end
end
