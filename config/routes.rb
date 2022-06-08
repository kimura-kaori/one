Rails.application.routes.draw do
  root 'top#index'
  devise_for :users
  resources :students do
    collection do
      get :mypage
    end
    member do
      resources :family_environments
    end
  end
  
  resources :emergency_contacts

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
