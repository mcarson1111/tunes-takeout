Rails.application.routes.draw do
#on the main page we ask them where they are?

 #search Charles' API site?? is this a patch/update?
  # get  '/monster/:id' =>

  resources :suggestions, only: [:index, :create]

  post 'favorite' => 'favorites#create', as: 'favorite'
  delete 'unfavorite' => 'favorites#destroy', as: 'unfavorite'
  get 'favorites' => 'suggestions#favorites', as: 'your_favorites'

  resources :sessions, :only => [:create]
  get "/auth/:provider/callback" => "sessions#create"
  delete "/logout" => "sessions#destroy", as: 'logout'


end
