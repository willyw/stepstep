ActionController::Routing::Routes.draw do |map|
  
  map.root :controller =>"welcome", :action =>"show"
  map.login "/login",:controller => "user_sessions", :action => "new"
  map.logout "/logout", :controller => "user_sessions", :action => "destroy"
  map.tutorial "/tutorial/:permalink", :controller =>"posts", :action => "show_public"
  
  map.register "/register", :controller => "users", :action => "new"
  map.add_details "/add_details/:post_id/:step_order", :controller => "steps", :action => "edit"
  
  map.resource :user_session
  map.resources :posts do |post|
    post.resources :steps
  end
 
  map.post_review "/review/:post_id", :controller =>"posts", :action => "review"
  map.resources :steps do |step|
    step.resources :details
  end
  

  
  map.resource :account, :controller => "users"
  map.resources :users
 
  map.generate_error "/generate_error" , :controller => "items", :action => "play_error"
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
