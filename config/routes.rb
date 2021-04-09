Rails.application.routes.draw do
  resources :users, except: [:show, :index, :new, :create, :destroy, :patch, :put] do
    resources(:products, except: [:show, :edit, :update, :destroy, :put])
  end

  resources(:products, except: [:put, :edit, :patch, :destroy, :update]) do
    resources :listings, only: [:new, :create]
  end

  resources :listings, only: [:new, :create, :index, :edit, :update, :destroy]

  get 'products_by_price', to: "products#byprice"
  get 'listings/max', to: "listings#max"
  get '/signup', to: "users#new", as: "signup"
  post '/signup', to: "users#create"
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"
  get "/auth/facebook/callback", to: "sessions#create_with_fb"
end

 ## Live coding process ##

 ## FIRST STEP, DON'T CODE, PSEUDO CODE

  #step 1 comment task given
  #display individual listing with the highest quantity attribute 

  #step 2 break it down into a request and respone
  #request: clickable link on index page that brings you to specifie listing
  #response: user sees listing with highest quantity

  # step 3 break down into more managable steps
  # 1. add link to page  - index view for listings
  # 2. create route for link - routes.rb
  # 3. create the controller action - listingscontroller.rb
  # 4. Find the correct listing (max?) - listing.rb 
  # 5. Show user listing on a view page - listings/show.rb


  
  #step 1 comment task given
  #Display the price next to the barbies and let the user sort by price

  #step 2 break it down into a request and respone
  #First: in the index page, display the price
  #request: clickable link on index page that sorts the list
  #response: user sees barbies with price in descending order

  # step 3 break down into more managable steps
  # 1. add price to barbies - index view for products
  # 2. add link to page  - index view for products
  # 3. create route for link - routes.rb
  # 4. Create the controller action - productscontroller.rb - to sort the products