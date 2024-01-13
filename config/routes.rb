Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: [:index]
  resources :trips do
    member do
      post 'reserve'
    end
    member do
      post 'notify'
    end
    resources :comments, only: [:create]
    collection do
      get :recherche
    end
  end

  get '/reserver/:id' => 'trips#show'

  root "pages#index"
end
