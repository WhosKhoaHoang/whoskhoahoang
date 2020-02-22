Rails.application.routes.draw do
    root "pages#index"
    get "login", to: "sessions#new"
    post "login", to: "sessions#create"
    delete "logout", to: "sessions#destroy"
    get "signup", to: "users#new"
    get "about", to: "pages#about"
    resources :posts #Gives all sorts of paths to update, delete, create, show
    resources :users, except: [:new]
end
