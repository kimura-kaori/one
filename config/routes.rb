Rails.application.routes.draw do
  resources :family_environments
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'top#index'
  devise_for :users
  resources :students

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
