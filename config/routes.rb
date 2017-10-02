Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#checksum_generator'

  resource :pages, only: [] do
    member do
      post :submit_checksum_generator
    end
  end
end
