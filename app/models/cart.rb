class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items, dependent: :destroy
  attr_accessible :line_item_id, :id

  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item.save
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.subtotal }
  end
end
