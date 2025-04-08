class Product < ApplicationRecord
 include Notifications # include concern

 has_many :subcribers, dependent: :destroy
 has_many_attached :images
 has_rich_text :description

 validates :name, presence: true
 validates :inventory_count, numericality: { greater_than_or_equal_to: 0 }
end
