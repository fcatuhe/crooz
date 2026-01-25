class Tender < ApplicationRecord
  delegated_type :tenderable, types: %w[User]

  has_many :croozers, dependent: :destroy

  def free?
    tenderable.is_a?(User)
  end

  def paid?
    !free?
  end
end
