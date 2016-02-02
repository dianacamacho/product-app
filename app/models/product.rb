class Product < ActiveRecord::Base


  belongs_to :supplier
  has_many :images 
  has_many :orders 
  has_many :categorized_products
  has_many :categories, through: :categorized_products

  has_many :carted_products
  has_many :orders, through: :carted_products



  def sale_message

    if price < 2
      "Discount Item!"
    else
      "On Sale!"
    end
  end

  def tax
    tax_percentage = 0.09
    price_tax = price * tax_percentage
  end

  def total
    total_price = price + tax
 
  end

def stock

  if inventory.to_i > 0
    "In Stock"
  else
    "Out of Stock"
  end
end

def get_first_image
  if images.first != nil
    images.first.image_url
  else 
    Image.first.image_url
  end
end

end

