class Refuel < ApplicationRecord
  include Passageable

  category :energy
  icon "refuel"

  validates :liters, presence: true

  def consumption
    if full_tank && previous_full_tank && passage&.start_reading && previous_full_tank.passage&.start_reading
      distance = passage.start_reading - previous_full_tank.passage.start_reading

      if distance.positive?
        (liters / distance) * 100
      end
    end
  end

  def previous_full_tank
    if passage&.started_on
      Refuel.joins(:passage)
        .where(passages: { croozer_id: passage.croozer_id })
        .where(full_tank: true)
        .where("passages.started_on < ?", passage.started_on)
        .order("passages.started_on desc")
        .first
    end
  end
end
