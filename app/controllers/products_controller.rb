class ProductsController < ApplicationController

  def macbook
    @macbook = Product.first
    @image = @macbook.image

  end

  def ipad
    @ipad = Product.find(2)
    @image = @ipad.image
  end

  def apple_tv
    @apple_tv = Product.find(3)
    @image = @apple_tv.image
  end

  def west_wing
      @west_wing = Product.find(4)
      @image = @west_wing.image
  end

  def studio_60
    @studio_60 = Product.find(5)
    @image = @studio_60.image
  end

  def newsroom
    @newsroom = Product.find(6)
    @image = @newsroom.image
  end

  def sports_night
    @sports_night = Product.find(7)
    @image = @sports_night.image
  end

  def ww_book
    @ww_book = Product.find(8)
    @image = @ww_book.image
  end

  def a_few_good_men
    @a_few_good_men = Product.find(9)
    @image = @a_few_good_men.image
  end

  def rizzo_jersey
    @rizzo_jersey = Product.find(10)
    @image = @rizzo_jersey.image
  end

  def products
    @products = Product.all
   
  end

end
