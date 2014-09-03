Rails.application.routes.draw do
  root 'posts#test'
  resources :posts
end
