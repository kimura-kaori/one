Rails.application.routes.draw do
  get 'users/show'
  root 'top#index'
  devise_for :users
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
  #
  #
  # resources :contacts do
  #   resources :comments
  # end
  # resources :students do
  #   collection do
  #     get :mypage
  #   end
  #   member do
  #     get :report
  #   end
  #     resources :family_environments
  #     resources :emergency_contacts
  # end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
