Rails.application.routes.draw do

  devise_for :users,skip: [:passwords], controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    # Twitter API認証用
    :omniauth_callbacks => 'users/omniauth_callbacks',
  }

  get '/' => 'homes#top', as: 'root'
  get '/about' => 'homes#about', as: 'about'
  get 'users/mypage' => 'users#mypage', as: 'mypage' do
    get :likes, on: :collection
  end
  get 'users/information/edit' => 'users#edit', as: 'user_edit_information'
  patch 'users/information' => 'users#update', as: 'user_update_information'
  get 'users/unsubscribe' => 'users#unsubscribe', as: 'confirm_unsubscribe'
  patch 'users/withdraw' => 'users#withdraw', as: 'withdraw_user'
  get 'users/:id' => 'users#show', as: 'user'
  get   'contacts'         => 'contacts#index'
  post  'contacts/confirm' => 'contacts#confirm'
  post  'contacts/thanks'  => 'contacts#thanks'
  resources :posts, only: [:new, :create, :show ,:edit, :update,] do
    resource :likes, only: [:create, :destroy]
  end
  get "search" => "searches#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
