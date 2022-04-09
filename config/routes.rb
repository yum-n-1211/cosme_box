Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get '/about' => 'homes#about', as: 'about'
  get 'users/mypage' => 'users#mypage', as: 'mypage' do 
    get :bookmarks, on: :collection 
  end
  get 'users/:id' => 'users#show', as: 'user_path'
  get 'users/information/edit' => 'users#edit', as: 'user_edit_information'
  patch 'users/information' => 'users#update', as: 'user_update_information'
  get 'users/unsubscribe' => 'users#unsubscribe', as: 'confirm_unsubscribe'
  patch 'users/withdraw' => 'users#withdraw', as: 'withdraw_user'
  get   'contacts'         => 'contacts#index'     # 入力画面
  post  'contacts/confirm' => 'contacts#confirm'   # 確認画面
  post  'contacts/thanks'  => 'contacts#thanks'    # 送信完了画面
  resources :posts, only: [:new, :create, :show ,:edit, :update,] do
    resource :likes, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
