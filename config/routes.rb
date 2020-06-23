Rails.application.routes.draw do
  namespace :admins do
    resources :users, only: [:index]
  end

  root to: redirect("/admins/users")
end
