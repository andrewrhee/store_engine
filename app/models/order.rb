class Order < ActiveRecord::Base
  attr_accessible :user_id, :status

  belongs_to :user
  has_many :order_products
end
