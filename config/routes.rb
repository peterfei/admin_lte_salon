Rails.application.routes.draw do
  resources :member_details
  resources :members do
    member do
      get 'charge'
      get 'rebill'

    end
    collection do
      get 'export'
    end
  end
  # devise_for :accounts
  get 'dashboard/index'
  devise_for :accounts, controllers: {
        sessions: 'accounts/sessions'
   }
  root to: 'dashboard#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
