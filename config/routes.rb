Shout::Application.routes.draw do
  resources :links, :only => [:new, :create, :show]
  get '*path', to: 'links#show'
  root 'links#new'
end
