Rails.application.routes.draw do

  get 'comments/create'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :session => 'users/sessions',
    :passwords => 'users/passwords'
  }

  devise_scope :user do
    get 'my_page' => 'users/registrations#my_page'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products, only: [:index, :new, :create, :show, :destroy]

  resources :transaction, only: [:show] do
      resources :agreement, only: [:show] do
        collection do
          post 'pay'
          get 'shipping'
          get 'deposit'
        end
      end
  end

  resources :comments, only: [:create]

end
