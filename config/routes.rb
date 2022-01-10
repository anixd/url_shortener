Rails.application.routes.draw do
  # root 'urls#index'
  # resources :urls, only: [:index, :new, :create, :show]

  resources :urls
  get '/urls' => 'urls#index'
  get 'urls/:id' => 'urls#show'
  get '/*unknown' => 'urls#retrieve'
  root 'urls#new'
end
