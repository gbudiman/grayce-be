class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def current_user
    @current_user ||= User.find(params[:id])
  end

  def render_as_json
    render json: Oj.dump(yield)
  rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotFound => e
    render json: { message: e.message }, status: :bad_request
  end
end
