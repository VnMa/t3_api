Rails.application.routes.draw do
  resources :games, only: [:index]
  post '/games/cell_click', to: 'games#cell_click'
  post '/games/reset_game', to: 'games#reset_game'
  post '/games/update', to: 'games#update'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
