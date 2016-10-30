class Item < ApplicationRecord

  validates :price, numericality: { greater_than: 0, allow_nil: true }
  # validates :name, :description, presence: true

  validates :name, :price ,presence: true

  has_many :positions
  has_many :carts, through: :positions

  has_many :comments, as: :commentable
  has_many :images,   as: :imageable
  accepts_nested_attributes_for :images

  has_and_belongs_to_many :orders

  # belongs_to :category

  # after_initialize { } #Item.new; Item.first
  # after_save       { } #Item.save; Item.create; Item.update_attributes()
  # after_create     { category.inc(:items_count, 1) }
  # after_update     { }
  # after_destroy	   { category.inc(:items_count, -1) } #Item.destroy

end
