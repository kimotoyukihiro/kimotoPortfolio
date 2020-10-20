Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top' => 'homes#top'
  root to: 'homes#top'
  get 'about' => 'homes#about'

  resources :items do
  	resource :nices, only: [:create, :destroy]
  	resources :items_comments, only: [:create, :destroy]
  end
end
