module Users
  class ActionPlansController < ApplicationController
    def complete
      render_as_json do
        action_plan.complete!
        action_plan.as_json(action_plan_as_json)
      end
    end

    def incomplete
      render_as_json do
        action_plan.incomplete!
        action_plan.as_json(action_plan_as_json)
      end
    end

    private

    def action_plan
      @action_plan ||= ActionPlan.find(params[:id])
    end

    def action_plan_as_json
      { except: [:created_at, :updated_at] }
    end
  end
end
