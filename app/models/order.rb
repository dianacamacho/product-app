class Order < ActiveRecord::Base

  validates :user_id, presence: true
  

  belongs_to :user
  
  has_many :carted_products
  has_many :products, through: :carted_products


  def friendly_created_at
    created_at.strftime("%b %e, %Y")
  end

  def calculate_totals
    subtotal = 0
    tax = 0
    total = 0
    
    carted_products.each do |carted_product|
      subtotal += (carted_product.subtotal).to_f
      tax += (carted_product.product.tax * carted_product.quantity).to_f
      total += (carted_product.product.total * carted_product.quantity).to_f
    end

    update({subtotal: subtotal, tax: tax, total: total})
  end

end
