Rails.application.routes.draw do

  root :to => 'moments#index'
  resources :moments

end
