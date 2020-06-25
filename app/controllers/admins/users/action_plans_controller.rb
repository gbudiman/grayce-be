module Admins
  module Users
    class ActionPlansController < ApplicationController
      def create
        render_as_json do
          action_plan = ActionPlan.create!(action_plan_params.merge(care_journey: care_journey))
          action_plan.as_json(action_plan_as_json)
        end
      end

      def update
        render_as_json do
          action_plan.update!(action_plan_params)
          action_plan.as_json(action_plan_as_json)
        end
      end

      private

      def action_plan
        @action_plan ||= action_name == 'create' ? care_journey.action_plans.find_by(params[:id]) : ActionPlan.find(params[:id])
      end

      def care_journey
        @care_journey ||= CareJourney.find(params[:care_journey_id])
      end

      def action_plan_params
        params.require(:action_plan).permit(:title)
      end

      def action_plan_as_json
        { except: [:created_at, :updated_at] }
      end
    end
  end
end
