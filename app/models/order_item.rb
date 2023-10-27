class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :plant

  validates :quantity, numericality: { only_integers: true }
end
