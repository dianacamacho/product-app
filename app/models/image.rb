class Image < ActiveRecord::Base

  validates :image_url, presence: true
  validates :image_url, uniqueness: true

  belongs_to :product
end
