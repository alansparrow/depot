class ChangeProductPriceTypeInLineItems < ActiveRecord::Migration
  def change
    change_column :line_items, :product_price, :decimal, precision: 8, scale: 2
  end
end
