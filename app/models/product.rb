# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  has_one_attached :main_image
  has_many :order_items, dependent: :destroy
  belongs_to :category, optional: true
  belongs_to :brand, optional: true

  scope :filter_by_category, ->(category_id) { where category_id: category_id }
  scope :filter_by_brand, ->(brand_id) { where brand_id: brand_id }

  has_many :cart_items, dependent: :destroy

  def main_image_path
    main_image.attached? ? main_image : 'main_image_placeholder.png'
  end
end
