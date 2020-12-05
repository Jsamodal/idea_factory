Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get('/', {to: 'welcome#index', as: 'root_path'})

  resources :ideas do
    resources :reviews, only:[:create, :destroy]
  end

end
