Rails.application.routes.draw do
  get 'teams/index'
  devise_for :teams
  root "teams#index"
  resources :teams, only: [:index, :show, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
    resources :players, only: [:index, :new, :create, :show]
  end
end
