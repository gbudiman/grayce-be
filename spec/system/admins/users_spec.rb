require "rails_helper"

RSpec.describe("admin users") do
  it "views a list of users" do
    visit("/admins/users")
    expect(page).to have_text("Users...")
  end
end
