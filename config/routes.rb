Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tops#top'
  get 'tops/top'
  resources :rooms do
    collection do
      get 'search'
    end
    resources :reservations, only: [:create]
    #post 'reservations/create'
  end
  #get 'reservations/index'
  #delete 'reservations/destroy'
  resources :reservations
end
