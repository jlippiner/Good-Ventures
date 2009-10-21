ActionController::Routing::Routes.draw do |map|

  map.resource :account, :controller => "users"
  map.resource :user
  map.resource :user_session

  map.with_options(:controller => "pages", :name_prefix => "page_") do |page|
    pages = %w(index about_us apply contact_us donations mentors sponsorships what_we_do)
    pages.each {|p|
      page.send(p.intern, "#{p}", :action => "#{p}", :controller => "pages")
    }
  end

  map.connect 'sandbox/:action', :controller => "sandbox"
  map.connect 'flash', :controller => 'application', :action => 'load_flash'

  map.root :controller => "pages"

end
