Rails.application.routes.draw do

  resources :users, except: :index
  get '/users/:id/groups', to: 'groups#users_groups', as: 'users_groups'

  resources :groups
  post '/groups/:id/join', to: 'groups#join', as: 'join_group'
  post '/groups/:id/leave', to: 'groups#leave', as: 'leave_group'

  resources :farts, only: [:create, :destroy]
  post '/farts/:id/guilty', to: 'farts#guilty', as: 'guilty'
  post '/farts/:id/regret', to: 'farts#regret', as: 'regret'

  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy'

  get '/', to: 'sessions#new'

end
