Rails.application.routes.draw do
  root 'mappings#new'

  resources :mappings, only: %i[index new create show]
end
