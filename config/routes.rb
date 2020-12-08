Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    get('/', {to: 'welcome#index', as: 'root'})
    get('/new', {to: 'welcome#new'})
    post('/', {to: 'welcome#create'})
    get('/destroy', {to: 'welcome#destroy'})

  resources :ideas do
    resources :reviews, only:[:create, :destroy]
    resources :likes, only:[:create, :destroy]
  
  end
  resources :users, only:[ :new, :create]
  resource :session, only:[:new, :create, :destroy]
  
end
