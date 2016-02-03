class Order < ActiveRecord::Base

  belongs_to :user
  
  has_many :carted_products
  has_many :products, through: :carted_products


  def friendly_created_at
    created_at.strftime("%b %e, %Y")
  end

end
