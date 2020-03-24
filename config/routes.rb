Rails.application.routes.draw do
  root 'mappings#new'

  resources :mappings, only: %i[index new create show]

  get '/:key', to: 'mappings#redirect_to_target', as: :redirect_key_to_target
end
