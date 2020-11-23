Rails.application.routes.draw do

  resources :certifications do 
    get "edit_certifications", to: "certifications#edit_certifications", as: "edit_certifications" 
    post "update_certifications", to: "certifications#update_certifications", as: "update_certifications" 
  end
  resources :languages do
    resources :code_snippets
    resources :learning_resources
  end 

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "languages#index"

end
