Rails.application.routes.draw do
  get 'teams/index'
  devise_for :teams
  root "teams#index"
  resources :teams, only: [:index, :show, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
  end
end
