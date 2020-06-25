class ActionPlan < ApplicationRecord
  belongs_to :care_journey

  enum status: { incomplete: 0, complete: 1 }

  validates :title, presence: true
end
