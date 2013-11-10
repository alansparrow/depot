# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  
  def add_product(product_id)
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      # This will not be reflected in Rails console because it will be on Database
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id, 
                                      product_price: Product.find(product_id).price)
                                      #product_price: current_item.product.price)
      # Cant't use the second method because current_item is nil now
      # This will be reflected in Rails console because 'build' is on memory
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
