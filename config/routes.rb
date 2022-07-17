Rails.application.routes.draw do

   # get 'top' => 'books#index'
   root to: 'books#index'
   resources :books

end
