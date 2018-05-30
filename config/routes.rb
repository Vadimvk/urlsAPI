Rails.application.routes.draw do
  post 'urls/create'
  get '/:short_url', to: 'urls#redirect'
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
