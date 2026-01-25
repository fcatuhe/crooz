class Car < ApplicationRecord
  has_one :croozer, as: :croozable, dependent: :destroy

  validates :make, :model, :year, presence: true
end
