Rails.application.routes.draw do
  root "todos#index"
  
  resources :todos 

  delete "/todos/:id" => "todos#destroy"
end
