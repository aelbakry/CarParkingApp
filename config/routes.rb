Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
		root to: 'homepage#home'

    #TBC change get route to be shorter
    get 'display/:id', to: 'account#display', as: 'account_display'
    # get '/account/overview', to: 'account#display', as: 'account_display'


end
