class Product < ActiveRecord::Base

  def sale_message

    if price < 2
      "Discount Item!"
    else
      "On Sale!"
    end
  end

  def price_string
    sprintf('%.2f', price)
  end

  def tax
    tax_percentage = 0.09
    price_tax = price * tax_percentage
    @total_tax = sprintf('%.2f', price_tax)

    "Sales tax (#{tax_percentage * 100}%) for this item: $#{@total_tax}"
  end

  def total
    taxed_price = price + @total_tax.to_f
    total_price = sprintf('%.2f', taxed_price)

    "Total price: $#{total_price}"  
  end

def stock

  if inventory.to_i > 0
    "In Stock"
  else
    "Out of Stock"
  end
end

end

