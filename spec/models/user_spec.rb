require "rails_helper"

RSpec.describe(User) do
  let(:user) { FactoryBot.create(:user) }

  it "has a name" do
    expect(user.name).to_not be_blank
  end
end
