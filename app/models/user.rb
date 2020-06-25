class User < ApplicationRecord
  has_many :care_journeys
  has_one :care_journey, -> { order(created_at: :desc) }

  validates :name, presence: true
end
