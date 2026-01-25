class Croozer < ApplicationRecord
  delegated_type :croozable, types: %w[Car]

  belongs_to :tender
  has_many :passages, dependent: :destroy

  validates :name, presence: true

  def average_consumption
    consumptions = passages.refuels.includes(:passageable).map do |passage|
      passage.passageable.consumption
    end.compact

    if consumptions.any?
      consumptions.sum / consumptions.size
    end
  end
end
