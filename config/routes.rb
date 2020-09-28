Rails.application.routes.draw do
  
  get 'profile/index'
  resources :sessions
  resources :users
  root 'welcome#index'

  resources :articles do
    resources :comments
    collection do
    	get :search
    end
  end

  resources :subscribers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
