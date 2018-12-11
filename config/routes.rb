Rails.application.routes.draw do
  resources :bookings
  resources :parkings

  get 'parking/search'
  get 'contact/show_form'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
		root to: 'homepage#home'

    get 'display/users/:id', to: 'account#display', as: 'account_display'
    get 'parking/search/:id/parkings', to: 'parking#book', as: 'book'
    get 'show_form', to: 'contact#show_form', as: 'contact'
    get 'bookings/show', to: 'bookings#show'
    get 'bookings/edit', to: 'bookings#edit'
    patch 'bookings/update', to: 'bookings#update'




    post 'request_contact', to: 'contact#request_contact'




end
