class Passage < ApplicationRecord
  delegated_type :passageable, types: Passageable::TYPES

  belongs_to :croozer
  belongs_to :author, class_name: "User"

  scope :refuels, -> { where(passageable_type: "Refuel") }
  scope :tales, -> { where(passageable_type: "Tale") }

  validates :started_on, presence: true

  def reading_delta
    if end_reading && start_reading
      end_reading - start_reading
    end
  end
end
