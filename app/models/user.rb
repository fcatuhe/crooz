class User < ApplicationRecord
  RESERVED_SLUGS = %w[session passwords up].freeze

  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  normalizes :name, with: ->(n) { n.strip }

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true, exclusion: { in: RESERVED_SLUGS }
end
