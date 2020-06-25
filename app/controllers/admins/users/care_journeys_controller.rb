module Admins
  module Users
    class CareJourneysController < ApplicationController
      def show
        render_as_json do
          care_journey.as_json(care_journey_as_json)
        end
      end

      def create
        render_as_json do
          care_journey = CareJourney.create!(care_journey_create_params.merge(user: user))
          care_journey.as_json(care_journey_as_json)
        end
      end

      def update
        render_as_json do
          care_journey.update!(care_journey_update_params)
          care_journey.as_json(care_journey_as_json)
        end
      end

      private

      def user
        @user ||= User.find(params[:user_id])
      end

      def care_journey
        @care_journey ||= user.care_journeys.find(params[:id])
      end

      def care_journey_create_params
        params.require(:care_journey).permit(:care_situation, :goals, :stage, :user_id)
      end

      def care_journey_update_params
        params.require(:care_journey).permit(:care_situation, :goals, :stage)
      end

      def care_journey_as_json
        {
          except: [:created_at, :updated_at],
          include: {
            user: { except: [:created_at, :updated_at] },
            action_plans: { except: [:created_at, :updated_at] },
          },
        }
      end
    end
  end
end
