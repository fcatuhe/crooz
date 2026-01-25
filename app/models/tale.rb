class Tale < ApplicationRecord
  include Passageable

  category :story
  icon "tale"

  validates :title, presence: true
end
