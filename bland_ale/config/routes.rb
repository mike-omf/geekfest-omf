Rails.application.routes.draw do
  get 'home/index'

  resources :bookmarks
  resources :users

  root :to => "home#index"


  mount Landable::Engine => '/' # move this to the end of your routes block
end
