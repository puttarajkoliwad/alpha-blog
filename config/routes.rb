Rails.application.routes.draw do
  #If webpacker doesn't run, try running "rails webpacker:install"

  # rails routes --expanded : This command lists all the routes of the application.
  
  #Home page
  root "pages#home"
  
  #About page
  get 'about', to:"pages#about"

  #Routes for resources can be generated with simple syntax: resources :articles
  resources :articles#, only:[:show, :index, :create, :new, :edit, :update, :destroy]

  get 'signup', to:'users#new'
  resources :users, except: [:new]

  get 'login', to:"sessions#new"
  post 'login', to:"sessions#create"
  delete 'logout', to:"sessions#destroy"


  resources :categories, except: [:destroy]

  

  #index: index is a special method that lists all the entries of a database table.
  #show: show is a method that shows any selected entry from the table.
end