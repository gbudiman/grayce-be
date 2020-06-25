FactoryBot.define do
  factory(:care_journey) do
    care_situation { nil }
    goals { nil }
    stage { 0 }
    user
  end
end
