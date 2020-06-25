RSpec.describe 'Action Plan Request', type: :request do
  let(:user) { build(:user) }
  let(:care_journey) { build(:care_journey, user: user) }
  let(:response_body) { JSON.parse(response.body).deep_symbolize_keys }
  let(:response_list) { JSON.parse(response.body).map(&:deep_symbolize_keys) }

  before do
    user.save!
    care_journey.save!
  end

  describe '#create' do
    subject(:create!) { post "/admins/users/#{user.id}/care_journeys/#{care_journey.id}/action_plans", params: params }

    let(:params) do
      {
        action_plan: { title: 'Something' },
      }
    end

    it 'creates an action plan' do
      create!
      expect(response_body).to include(
        :id, :title, :status,
        care_journey_id: care_journey.id
      )
    end
  end

  describe '#update' do
    subject(:update!) { patch "/admins/action_plans/#{action_plan.id}", params: params }

    let(:action_plan) { build(:action_plan, care_journey: care_journey) }

    let(:params) do
      {
        action_plan: { title: SecureRandom.uuid },
      }
    end

    before do
      action_plan.save!
    end

    it 'updates the action plan' do
      update!
      expect(response_body).to include(title: params[:action_plan][:title])
    end
  end
end
