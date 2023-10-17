class Plant < ApplicationRecord
  belongs_to :category

  validates :name, :price, presence: true
  validates :stock, numericality: { only_integers: true }
  validates :price, numericality: true
end
