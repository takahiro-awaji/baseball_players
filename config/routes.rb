Rails.application.routes.draw do
  get 'teams/index'
  devise_for :teams
  root "teams#index"
end
