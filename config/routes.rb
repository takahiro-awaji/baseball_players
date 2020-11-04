Rails.application.routes.draw do
  get 'teams/index'
  devise_for :teams
  root "teams#index"
  get '/' => 'teams#show', as: :signin
  resources :teams, only: [:index, :show, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
    resources :players
    resources :games
  end
end
