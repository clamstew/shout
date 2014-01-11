Shout::Application.routes.draw do
  resources :links, :only => [:new, :create, :show]
  root 'links#new'
end
