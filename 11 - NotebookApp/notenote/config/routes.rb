Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :notes

  authenticated :user do
    root 'notes#index', as: 'authenticated_root'
    # root 'notes#index'  -------this still works, probs rails 5 or devise upgrade
  end

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
