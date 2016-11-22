Rails.application.routes.draw do
  devise_for :users
  root 'students#create'

  resources :students do
    get :subjects
  end

  resources :teachers
  resources :visitors
  resources :reports, only: :subjects



end
