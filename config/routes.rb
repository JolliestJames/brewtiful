Rails.application.routes.draw do
  resources :brews
  resources :pubs
  resources :breweries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
