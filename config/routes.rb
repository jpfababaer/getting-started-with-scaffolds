#NOTES -> start at app/views/movies/index

Rails.application.routes.draw do
  resources :books
  # Routes for the Movie resource:

  #11 Reusing forms: if we look at the pages for /books' index or show, there are NO forms to add or edit books. INSTEAD, there's a link that brings you to that form. We should recreate it now for our MOVIES. SEARCH movies_controller.rb
  get("/movies/new", { controller: "movies", action: "new"})

  #15 Reusing forms:
  get("/movies/:id/edit" , controller: "movies", action: "edit")

  #4 Using RESTful API to adhere to naming convertion that most developers use. This utilizes the VERBS (get, post, patch, delete, etc.) in order to define our routes. We don't have to be as descriptive as long as we use the proper VERB. Rails won't get confused since we are specifying the appropriate verb. Make sure to UPDATE the "action" attributes of the <form> in index. SEARCH movies_controller.rb


  # CREATE = POST = route can just be /movies
  post("/movies", { :controller => "movies", :action => "create" })
          
  # READ = GET
  get("/movies", { :controller => "movies", :action => "index" })
  
  #9 Real world convention for defining the params value just use "id" instead of "path_id" so change it so. Make sure to adjust the params.fetch() logic in the controller as well. SEARCH README.md
  get("/movies/:id", { :controller => "movies", :action => "show" })
  
  # UPDATE = PATCH 
  patch("/movies/:id", { :controller => "movies", :action => "update" })
  
  # DELETE = DELETE
  delete("/movies/:id", { :controller => "movies", :action => "destroy" })

  #------------------------------

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
