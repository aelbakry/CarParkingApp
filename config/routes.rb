Rails.application.routes.draw do
  get 'contact/show_form'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
		root to: 'homepage#home'

    #TBC change get route to be shorter
    get 'display/:id', to: 'account#display', as: 'account_display'



    get 'show_form', to: 'contact#show_form', as: 'contact'
    post 'request_contact', to: 'contact#request_contact'



end
