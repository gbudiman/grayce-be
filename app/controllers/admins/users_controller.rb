module Admins
  class UsersController < ApplicationController
    def index
      render_as_json do
        User.all.as_json(user_as_json)
      end
    end

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
        except: [:created_at, :updated_at],
        include: {
          care_journeys: { except: [:created_at, :updated_at] },
        },
      }
    end
  end
end
