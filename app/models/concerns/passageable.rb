module Passageable
  extend ActiveSupport::Concern

  TYPES = %w[Refuel Tale].freeze

  included do
    has_one :passage, as: :passageable, dependent: :destroy

    class_attribute :passage_category
    class_attribute :passage_icon
  end

  class_methods do
    def types
      TYPES
    end

    def category(name)
      self.passage_category = name
    end

    def icon(emoji)
      self.passage_icon = emoji
    end
  end
end
