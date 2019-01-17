Rails.application.routes.draw do
  scope 'v1.0.0' do
    resources :shelters, only: [:create, :destroy] do
      resources :workers, only: [:create, :destroy]
      resources :pets, only: [:index, :create, :show] do
        member do
          post :set_adoptable
          post :delist
        end
  
        resource :adoption_request, only: [:show, :destroy]
      end
    end
  end
end
