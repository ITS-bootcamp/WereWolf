Rails.application.routes.draw do
  root 'rooms#index'
  resources :rooms, except: [:edit, :update], shallow: true do
    resources :comment, only: [:index, :create]
  end
  scope :rooms do
    post '/:id/user' => 'rooms#create_room_user'
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
