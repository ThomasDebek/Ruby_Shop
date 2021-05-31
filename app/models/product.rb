class Product < ApplicationRecord
  validates :name, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  has_one_attached :main_image

  def main_image_path
    main_image.attached? ? main_image : 'http://placehold.it/700x400'
  end

end
