FactoryBot.define do
  factory(:action_plan) do
    care_journey
    title { SecureRandom.uuid }
    status { 0 }
  end
end
