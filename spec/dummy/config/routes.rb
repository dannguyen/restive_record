Dummy::Application.routes.draw do
  resources :articles, :only => [:create]
end
