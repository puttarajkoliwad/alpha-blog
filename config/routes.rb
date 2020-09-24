Rails.application.routes.draw do
  #If webpacker doesn't run, try running "rails webpacker:install"
  
  #Home page
  root "pages#home"
  
  #About page
  get 'about', to:"pages#about"
end
