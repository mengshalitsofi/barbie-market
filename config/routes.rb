Rails.application.routes.draw do
  resources :users, except: [:show, :index, :new, :create, :destroy, :patch, :put] do
    resources(:products, except: [:show, :edit, :update, :destroy, :put])
  end

  resources(:products, except: [:put, :edit, :patch, :destroy, :update]) do
    resources :listings, only: [:new, :create]
  end

  resources :listings, only: [:new, :create, :index, :edit, :update, :destroy]

  get '/signup', to: "users#new", as: "signup"
  post '/signup', to: "users#create"
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"
  get "/auth/facebook/callback", to: "sessions#create_with_fb"

end
