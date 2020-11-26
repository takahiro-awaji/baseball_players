Rails.application.routes.draw do
  get 'teams/index'
  devise_for :teams
  root "teams#top"
  get '/' => 'teams#show', as: :signin
  resources :teams, only: [:index, :show, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
    resources :players
    resources :games do
      resources :batting_stats, only: [:new, :create]
      resources :pitching_stats, only: [:new, :create]
    end
  end
end
