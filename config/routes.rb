Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :destroy, :new, :show]
  resource :sessions, only: [:create, :destroy, :new]

  resources :bands, only: [:show] do
    resources :albums, only: [:new]
  end

  resources :albums, only: [:show] do
    resources :tracks, only: [:new]
  end

  resources :albums, only: [:create, :destroy, :update, :edit, :new]
  resources :bands, only: [:create, :destroy, :update, :edit, :index, :new]
  resources :tracks, only: [:create, :destroy, :update, :edit, :show]

end
