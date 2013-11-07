class AddProductPriceToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :product_price, :integer, default: 1
  end
end
