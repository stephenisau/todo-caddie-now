Rails.application.routes.draw do
  root "todos#index"
  
  get "/todos/:month" => "todos#get_by_month"
  get "/todos/:date" => "todos#get_by_date"
  # RESTful routes for all our todos
  resources :todos

  delete "/todos/:id" => "todos#destroy"
end
