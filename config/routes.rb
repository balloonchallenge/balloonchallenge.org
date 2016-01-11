Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}, :controllers => {:registrations => "registrations", :sessions => "sessions"}
  root 'static_pages#home'

  match '/about',     to: 'static_pages#about',     via: 'get'
  match '/tutorials', to: 'static_pages#tutorials', via: 'get'
  match '/faq',       to: 'static_pages#faq',       via: 'get'
  match '/balloon',   to: redirect('https://community.balloonchallenge.org/t/balloon-overview/665'),   via: 'get'
  match '/parachute', to: redirect('https://community.balloonchallenge.org/t/parachute-overview/659'), via: 'get'
  match '/radar-reflector', to: redirect('https://community.balloonchallenge.org/t/radar-reflector/656'),via: 'get'
  match '/helium',    to: redirect('https://community.balloonchallenge.org/t/balloon-inflation-and-gases/658'),    via: 'get'
  match '/camera',    to: redirect('https://community.balloonchallenge.org/t/camera-overview/671'),    via: 'get'
  match '/get-involved', to: 'static_pages#get-involved', via: 'get'
  match '/gallery',   to: 'static_pages#gallery',   via: 'get'
  match '/learn-more',to: 'static_pages#learn-more',via: 'get'
  match '/learn-more-beginner',to:'static_pages#learn-more-beginner',via:'get'
  match '/contact',   to: 'static_pages#contact',   via: 'get'
  match '/regulations',to: redirect('https://community.balloonchallenge.org/t/regulations-overview-including-contacting-the-us-faa/676'),via: 'get'
  match '/education', to: 'static_pages#education', via: 'get'
  match '/get-involved/prizes',    to: 'static_pages#prizes',    via: 'get'
  match '/flight-predictors',to: redirect('https://community.balloonchallenge.org/t/flight-prediction-overview/672'),via:'get'
  match '/safety',    to: redirect('https://community.balloonchallenge.org/t/safety-overview/675'),    via: 'get'
  match '/what-is-a-hab',to: redirect('https://community.balloonchallenge.org/t/what-is-a-high-altitude-balloon-hab/678'),    via: 'get'
  match '/supplies',  to: redirect('https://community.balloonchallenge.org/t/hab-supplies-list/677'),  via: 'get'
  match '/mission-ops',to: redirect('https://community.balloonchallenge.org/t/mission-operations-how-to-prepare-and-launch-successfully/673'),       via: 'get'
  match '/tracker',   to: redirect('https://community.balloonchallenge.org/t/hab-tracking-methods/669/1'),   via: 'get'
  match '/tracker-products',to: redirect('https://community.balloonchallenge.org/t/current-gps-tracker-products/668'),via:'get'
  match '/make-a-tracker',to: redirect('https://community.balloonchallenge.org/t/build-your-own-tracker-antenna-theory/666'),via:'get'
  match '/payload',   to: redirect('https://community.balloonchallenge.org/t/payload-overview/660'),   via: 'get'
  match '/flight-termination',to: redirect('https://community.balloonchallenge.org/t/flight-termination-unit/654'),via:'get'
  match '/rope',      to: redirect('https://community.balloonchallenge.org/t/cord-and-connectors/655'),      via: 'get'
  match '/sensor',    to: redirect('https://community.balloonchallenge.org/t/payload-sensors/657'),    via: 'get'
  match '/power',     to: redirect('https://community.balloonchallenge.org/t/payload-power-and-batteries/661'),     via: 'get'
  match '/cost',      to: redirect('https://community.balloonchallenge.org/t/hab-cost-breakdown/674'),      via: 'get'
  match '/winners',   to: 'static_pages#winners',   via: 'get'
  # match '/registration/thanks', to: 'static_pages#thanks_register', via: 'get'
  match '/teams/:id/add_member/', to: 'teams#add_member', via: 'post', as: 'add_member'
  match '/teams/:id/remove_member/', to: 'teams#remove_member', via: 'delete', as: 'remove_member'
  match '/teams/feed' => 'teams#feed', :as => :feed, :defaults => {:format => 'atom'}, via: 'get'
  match '/teams/thanks', to: 'teams#thanks', via: 'get'
  get '/teams/launch', to: 'teams#launch', as: 'launches'
  get '/teams/admin' => 'teams#admin'
  get '/teams/subregion_options' => 'teams#subregion_options'
  get '/teams/all' => 'teams#all_teams'
  get '/teams/search' => 'teams#search'
  devise_scope :user do

    get '/users/sso' => 'sessions#sso'
  end
  resources :teams
  post 'requests/create' => 'requests#create'
  resources :requests
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
