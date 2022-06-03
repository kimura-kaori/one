Rails.application.routes.draw do
  devise_for :users
  root 'students#index'
  resources :students
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
