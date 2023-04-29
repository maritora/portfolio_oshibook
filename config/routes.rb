Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    get 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  root 'top#index' 
  get 'users/account', to: 'users#account'
  post 'profiles/new'
  post 'profiles/show' 
  post 'profiles/:id/edit' => 'profiles#edit'

  get 'profiles/myprofile' => 'profiles#myprofile_index'
  post 'profiles/myprofile' #自身の投稿一覧
  post 'profiles/back' 

  resources :profiles, only: [:index, :create, :new, :show, :edit, :update, :destroy] do
    collection do
      get :search, to: 'profiles#search'
    end
  end
end
