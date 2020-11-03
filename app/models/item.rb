class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  # has_one :order
  has_one_attached :image
  
  belongs_to_active_hash :category
  belongs_to_active_hash :sale_status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery
  
  validates :image, :name, :info, :category, :sale_status, :shipping_fee, :prefecture, :scheduled_delivery, presence: true

  validates :category_id, :sale_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, numericality: { other_than: 1 } 

  with_options presence: true, format: { with:/\A[0-9]+\z/,message: 'Half-width number'} do
    validates :price
  end
  validates :price ,:numericality => { :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999, :message => 'Out of setting range' }
end
