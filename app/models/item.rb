class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order
  has_one_attached :image
  
  belongs_to_active_hash :category
  belongs_to_active_hash :sale_status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery
  
  with_options presence: true do
    validates :image  
    validates :name
    validates :info
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :sale_status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

  with_options presence: true, format: { with:/\A[0-9]+\z/,message: 'Half-width number'} do
    validates :price
  end
  validates :price ,:numericality => { :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999, :message => 'Out of setting range' }
end
