Rails.application.routes.draw do
#on the main page we ask them where they are?

 #search Charles' API site?? is this a patch/update?
  # get  '/monster/:id' =>

  resources :suggestions, only: [:index, :create]

end
