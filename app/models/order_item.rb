class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :plant

  validates :quantitiy, numericality: { only_integers: true }
end
