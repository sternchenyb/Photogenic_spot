Rails.application.routes.draw do
# 顧客用
# URL /users/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

devise_scope :admin do
    get '/admin/sign_out' => 'admin/sessions#destroy'
  end

 scope module: :public do
   root to: "homes#top"
   get 'about' => 'homes#about'
   resources :favorites, only: [:create, :destroy]
   resources :spot_comments, only: [:create, :destroy]
   resources :genres, only: [:show]
   get 'users/cancel' => 'users#cancel'
   patch 'users/withdraw' => 'users#withdraw'
   get 'userrs/my_page' => 'users#show'
   get 'users/information/edit' => 'users#edit'
   patch 'users/information' => 'users#update'
   delete '/spots/destroy_all' => 'spots#destroy_all'
   resources :spots, only: [:index,:update,:destroy,:create,:edit,:show,:new]
 end
 namespace :admin do
   root to: "homes#top"
   resources :spots, only: [:index,:create,:show,:edit,:update,:destroy]
   resources :genres, only: [:index,:create,:edit,:update,:destroy]
   resources :users, only: [:index,:show,:edit,:update]
   
 end
end
