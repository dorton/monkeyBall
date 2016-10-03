Rails.application.routes.draw do

resources :actions

  root 'monkeys#index'

  resources :monkeys

  get	'/plot', to: 'monkeys#plot'

  get '/datas', to: 'monkeys#datas'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
