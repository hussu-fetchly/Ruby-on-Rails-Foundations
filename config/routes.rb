Rails.application.routes.draw do

  devise_for :users
  get "contact", to: "pages#contact"
  get "about", to: "pages#about"

  get "blog", to: redirect("https://example.com")

  resources :projects

  root "pages#home"

  get "*path", to: redirect('/404')

end
