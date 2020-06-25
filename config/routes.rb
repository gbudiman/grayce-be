Rails.application.routes.draw do
  namespace :admins do
    resources :users, only: [:index, :show] do
      resources :care_journeys, module: :users, only: [:create, :update, :show] do
        resources :action_plans, only: [:create]
      end
    end

    resources :action_plans, module: :users, only: [:update]
  end

  resources :users, only: [:show]
  resources :action_plans, module: :users, only: [] do
    member do
      post :complete
      post :incomplete
    end
  end
end
