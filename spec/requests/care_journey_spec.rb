RSpec.describe 'Care Journey Request', type: :request do
  let(:admin) { build(:user) }
  let(:user) { build(:user) }
  let(:response_body) { JSON.parse(response.body).deep_symbolize_keys }
  let(:response_list) { JSON.parse(response.body).map(&:deep_symbolize_keys) }

  before do
    admin.save!
    user.save!
  end

  describe '#show' do
    subject(:show!) { get "/admins/users/#{user.id}/care_journeys/#{care_journey.id}" }

    let(:care_journey) { build(:care_journey, user: user) }
    let(:action_plan) { build(:action_plan, care_journey: care_journey) }

    before do
      care_journey.save!
      action_plan.save!
    end

    it 'shows Care Journey object' do
      show!
      expect(response_body).to include(
        id: care_journey.id,
        action_plans: include(
          hash_including(
            id: action_plan.id,
          ),
        ),
      )
    end
  end

  describe '#create' do
    subject(:create!) { post "/admins/users/#{user.id}/care_journeys", params: params }

    let(:params) do
      {
        care_journey: {
          stage: 'independent',
        },
      }
    end

    it 'creates a Care Journey object' do
      create!
      expect(response_body).to include(
        :id, :care_situation, :goals,
        stage: 'independent',
        user: hash_including(
          :name,
          id: user.id,
        )
      )
    end
  end

  describe '#update' do
    subject(:update!) { patch "/admins/users/#{user.id}/care_journeys/#{care_journey.id}", params: params }

    let(:care_journey) { build(:care_journey, user: user) }
    let(:params) do
      {
        care_journey: {
          stage: 'crisis',
        },
      }
    end

    before do
      care_journey.save!
    end

    it 'updates Care Journey' do
      update!
      expect(response_body).to include(stage: 'crisis')
    end
  end
end
