# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :text
#  email      :string(255)
#  pay_type   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  PAYMENT_TYPES =  PaymentType.all.pluck(:payment_type)
  #["Check", "Credit card", "Purchase Order"]
  #@@payment_types = PaymentType.all.pluck(:payment_type)

  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES#@@payment_types#PAYMENT_TYPES

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      # Because cart will be destroyed after items are added into order
      item.cart_id = nil 

      #self.line_items
      line_items << item 
    end
  end

#  def self.payment_types
#    @@payment_types
#  end
  
end

