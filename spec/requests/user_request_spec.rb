RSpec.describe 'User Request', type: :request do
  let(:user) { build(:user) }
  let(:care_journey) { build(:care_journey, user: user) }
  let(:action_plan) { build(:action_plan, care_journey: care_journey) }
  let(:response_body) { JSON.parse(response.body).deep_symbolize_keys }
  let(:response_list) { JSON.parse(response.body).map(&:deep_symbolize_keys) }

  before do
    user.save!
    care_journey.save!
    action_plan.save!
  end

  describe '#show' do
    subject(:show!) { get "/users/#{user.id}" }

    it 'returns user with care journey and action plans' do
      show!
      expect(response_body).to include(
        name: user.name,
        care_journey: hash_including(
          id: care_journey.id,
          action_plans: include(
            hash_including(
              id: action_plan.id,
              care_journey_id: care_journey.id,
              title: action_plan.title,
              status: 'incomplete',
            ),
          ),
        ),
      )
    end
  end

  describe '#complete' do
    subject(:complete!) { post "/action_plans/#{action_plan.id}/complete" }

    context 'with plan in incomplete state' do
      before { action_plan.incomplete! }

      it 'completes the plan' do
        complete!
        expect(response_body).to include(
          id: action_plan.id,
          status: 'complete',
        )
      end
    end
  end

  describe '#incomplete' do
    subject(:incomplete!) { post "/action_plans/#{action_plan.id}/incomplete" }

    context 'with plan in completed state' do
      before { action_plan.complete! }

      it 'incomplete the plan' do
        incomplete!
        expect(response_body).to include(
          id: action_plan.id,
          status: 'incomplete',
        )
      end
    end
  end

  context 'with admin namespace' do
    describe '#index' do
      subject(:index!) { get '/admins/users' }

      it 'lists users' do
        index!
        expect(response_list).to include(
          hash_including(
            id: user.id,
            care_journeys: include(
              hash_including(id: care_journey.id),
            ),
          ),
        )
      end
    end

    describe '#show' do
      subject(:show!) { get "/admins/users/#{user.id}" }

      it 'displays users' do
        show!
        expect(response_body).to include(
          id: user.id,
          care_journeys: include(
            hash_including(id: care_journey.id),
          ),
        )
      end
    end
  end
end
