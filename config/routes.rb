Rails.application.routes.draw do
  resources :schedules
  devise_for :users
  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'projects/index'
  get 'projects/home'

# get '"schedules/index", to: "projects#index"'

  get '/main/home'
  get 'about-us', :to => 'main#aboutus'
  get 'schedules/index'
  get 'projects/index'
  get '/admin/dashboard'
  get '/admin/ban/:id', to: 'admin#ban'
  get '/admin/permit/:id', to: 'admin#permit'
  # root to: 'projects#home'
  root to: 'main#index'
end
