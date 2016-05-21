Rails.application.routes.draw do
#on the main page we ask them where they are?

 #search Charles' API site?? is this a patch/update?
  # get  '/monster/:id' =>

  resources :suggestions, only: [:index, :create]

  post '/favorites/:suggestion_id' => 'favorites#create', as: 'favorites'
  delete '/favorites/:suggestion_id' => 'favorites#destroy', as: 'unfavorites'
  get 'favorites/:user_id' => 'favorites#your_favorites', as: 'your_favorites'

  resources :sessions, :only => [:create]
  get "/auth/:provider/callback" => "sessions#create"
  delete "/logout" => "sessions#destroy", as: 'logout'


end
