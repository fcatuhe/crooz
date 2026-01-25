class User < ApplicationRecord
  has_secure_password

  has_many :sessions, dependent: :destroy
  has_one :tender, as: :tenderable, dependent: :destroy
  has_many :croozers, through: :tender
  has_many :passages, foreign_key: :author_id, inverse_of: :author

  normalizes :email, with: ->(e) { e.strip.downcase }

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  def croozer
    croozers.first
  end
end
