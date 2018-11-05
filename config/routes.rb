Rails.application.routes.draw do
  resources :bookings
  resources :parkings

  get 'parking/search'
  get 'contact/show_form'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
		root to: 'homepage#home'

    #TBC change get route to be shorter
    get 'display/:id', to: 'account#display', as: 'account_display'
    get 'parking/book/:parkingRef/parkings', to: 'parking#book', as: 'book'





    get 'parking/search', to: 'parking#search', as: 'search_page'


    get 'show_form', to: 'contact#show_form', as: 'contact'
    post 'request_contact', to: 'contact#request_contact'



end
