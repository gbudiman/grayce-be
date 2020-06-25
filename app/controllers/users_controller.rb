class UsersController < ApplicationController
  def show
    render_as_json do
      user.as_json(user_as_json)
    end
  end

  private

  def user
    @user ||= User.find(params[:id])
  end

  def user_as_json
    {
      only: [:id, :name],
      include: {
        care_journey: {
          except: [:created_at, :updated_at],
          include: {
            action_plans: { except: [:created_at, :updated_at] },
          },
        },
      },
    }
  end
end
