class Order < ActiveRecord::Base

  belongs_to :user
  belongs_to :product

  def friendly_created_at
    created_at.strftime("%b, %e, %Y")
  end

end
