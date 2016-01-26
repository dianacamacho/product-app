class Product < ActiveRecord::Base

  belongs_to :supplier
  has_many :images

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

end

