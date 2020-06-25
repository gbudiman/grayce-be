class CareJourney < ApplicationRecord
  has_many :action_plans, dependent: :destroy
  belongs_to :user

  enum stage: { independent: 0, interdependent: 1, dependent: 2, crisis: 3, griefing: 4 }
end
