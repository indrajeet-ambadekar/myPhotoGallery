Rails.application.routes.draw do
  get 'folders/view'

  post 'folders/add'

  get 'folders/update'

  get 'folders/delete'

  get 'folders/add_file'

  get 'photo/view'

  post 'photo/add'

  get 'photo/update'

  get 'photo/delete'

  devise_for :users
  root :to => "photo#view"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
