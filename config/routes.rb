Rails.application.routes.draw do
  namespace :public do
    get 'relationships/followings'
    get 'relationships/followers'
  end
  # ユーザー用
  # URL /users/sign_in ...
  devise_for :user, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
    # ゲストサインインのパスワード
    passwords: 'public/passwords'
  }

  # 管理者用
   #URL /admin/sign_in ...
   devise_for :admin, skip: [:passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # ユーザー用ゲストサインイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#new_guest'
  end

  devise_scope :admin do
    get '/admin/sign_out' => 'admin/sessions#destroy'
  end


 scope module: :public do
   root to: 'homes#top'
   get 'about' => 'homes#about'
   get 'users/cancel' => 'users#cancel'
   patch 'users/withdraw' => 'users#withdraw'
   #get 'users/my_page' => 'users#show'
   get 'users/information/edit' => 'users#edit'
   patch 'users/information' => 'users#update'
   #delete '/spots/destroy_all' => 'spots#destroy_all'
   get "/search" => "spots#search"
   resources :spots, only: [:index,:update,:destroy,:create,:edit,:show,:new] do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
   end
   resources :genres, only: [:show]
   resources :users, only: [:withdraw,:cancel,:update,:destroy,:create,:edit,:show,:new]  do
    resource :relationships, only: [:create, :destroy]
    get 'follow' => 'relationships#follow', as: 'follow'
   end
 end

 namespace :admin do
   root to: "homes#top"
   resources :spots, only: [:index,:create,:show,:edit,:update,:destroy]
   resources :genres, only: [:index,:create,:edit,:update,:destroy]
   resources :users, only: [:index,:show,:edit,:update] do
      resources :comments, only: [:index]
    end
   resources :comments, only: [:edit,:update,:destroy]
 end
end
