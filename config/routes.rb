Rails.application.routes.draw do
  get 'users/show'
  root 'top#index'
  devise_for :users
    devise_scope :user do
      post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
      post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
    end
  resources :users, only: [:show] do
      resources :contacts do
        resources :comments
      end
      resources :students do
        member do
          get :report
        end
          resources :family_environments
          resources :emergency_contacts
      end
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
