Rails.application.routes.draw do

  resources :certifications
  resources :languages do
    resources :code_snippets
    resources :learning_resources
  end 

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "languages#index"

end
