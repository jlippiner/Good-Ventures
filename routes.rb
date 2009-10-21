ActionController::Routing::Routes.draw do |map|

  map.ip_address_lookup 'websites/ip_address', :action => :ip_address_lookup, :controller => "websites"

  map.resource :account, :controller => "users"
  map.resource :user
  map.resource :user_session
  map.resources :clients, :member => {:deactivate => :get, :activate => :get} do |client|
    client.resources :websites, :shallow => true, :member => {:deactivate => :get, :activate => :get, :code => :get}  do |website|
      website.resources :experiences, :member => {:deactivate => :get, :activate => :get}
      website.resources :groups, :member => {:deactivate => :get, :activate => :get, :select => :get, :assignment => :get}
      website.resources :goals, :member => {:deactivate => :get, :activate => :get}
      website.resource :google_analytic, :member => {:load_pages => :post, :save_pages => :post}
    end
  end

  map.with_options(:controller => "visits", :name_prefix => "visit_") do |visit|
    visit.connect 'visit/track.gif', :controller => "visits", :action => "create"
    map.resources :visits, :only => [:new, :create, :edit, :update, :show], :as => "visit", :path_names => { :new => 'track' }
  end

  map.with_options(:controller => "conversions", :name_prefix => "conversion_") do |conversion|
    conversion.connect 'conversion/track.gif', :controller => "conversions", :action => "create"
    map.resources :conversions, :as => "conversion", :only => [:new, :create, :edit, :update, :show], :path_names => { :new => 'track' }
  end

  map.connect 'sandbox/:action', :controller => "sandbox"
  map.connect 'flash', :controller => 'application', :action => 'load_flash'  

  map.root :controller => "user_sessions", :action => "new"

end
