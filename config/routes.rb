Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'top#index'
  devise_for :users
  resources :students do
    collection do
      get :mypage
    end
  end
  resources :family_environments

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
