Shout::Application.routes.draw do

  get 'admin' => 'admin#new'
  resource :admin, :controller => 'admin', :only => [:create, :destroy]

  resources :links, :only => [:new, :create, :show]
  get '*path', to: 'links#show'

  root 'links#new'
end
