Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope :path => '/api/v1/', :module => "api_v1", :as => 'v1', :defaults => { :format => :json } do
    resources :missions
  end

  root 'welcome#hello_world'

  get 'rooms/show'

  #Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
