Rails.application.routes.draw do
  
    get "/api/applicants", to: "applicants#index"
    get "api/applicants/detail",  to:"applicants#detail"
    delete "api/applicants/delete", to: "applicants#destroy"

    post "api/applicants/validate", to: "applicants#validate"
    post "api/applicants/create", to: "applicants#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :users, only: [:create]
    post "auth/login", to: "users#login"
    get "auth/auto_login", to: "users#auto_login"
end
