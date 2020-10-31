Rails.application.routes.draw do
  get 'teams/index'
  devise_for :teams
  root "teams#index"
  resources :teams, only: [:index, :show, :edit, :update, :destroy]
end
