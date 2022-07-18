Rails.application.routes.draw do

   # get 'top' => 'books#index'
  root to: "books#top"
   resources :books

end
