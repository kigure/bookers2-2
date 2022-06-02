Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :bookcomments, only: [:create, :destroy], as: 'book_comments'
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update]
  
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

