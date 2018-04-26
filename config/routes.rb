Rails.application.routes.draw do

  resources :locations

  get 'folders/view'

  post 'folders/add'

  get 'folders/update'

  get 'folders/delete'

  get 'files/view/',:controller => 'photo', :action => 'view_all'

  get 'files/view/:id',:controller => 'photo', :action => 'view'

  post 'photo/add'

  get 'photo/update'

  get 'photo/delete'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  root :to => "folders#view"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
