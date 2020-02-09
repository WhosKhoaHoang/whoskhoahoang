Rails.application.routes.draw do
    root "pages#index"
    get "about", to: "pages#about"
    resources :posts #Gives all sorts of paths to update, delete, create, show
end
