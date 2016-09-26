Rails.application.routes.draw do
  get 'rooms/index'

  get 'rooms/show'

  get 'rooms/new'

  get 'rooms/create'

  get 'rooms/destroy'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
