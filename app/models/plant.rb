class Plant < ApplicationRecord
  belongs_to :category

  validates :name, :price, presence: true
  validates :stock, numericality: { only_integers: true }
  validates :price, numericality: true

  def self.ransackable_associations(auth_object = nil)
    ["category"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "description", "id", "name", "price", "stock", "updated_at"]
  end
end
