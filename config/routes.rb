Rails.application.routes.draw do
  # Routes for the Location resource:

  # CREATE
  get("/locations/new", { :controller => "locations", :action => "new_form" })
  post("/create_location", { :controller => "locations", :action => "create_row" })

  # READ
  get("/locations", { :controller => "locations", :action => "index" })
  get("/locations/:id_to_display", { :controller => "locations", :action => "show" })

  # UPDATE
  get("/locations/:prefill_with_id/edit", { :controller => "locations", :action => "edit_form" })
  post("/update_location/:id_to_modify", { :controller => "locations", :action => "update_row" })

  # DELETE
  get("/delete_location/:id_to_remove", { :controller => "locations", :action => "destroy_row" })

  #------------------------------

  # Routes for the Item resource:

  # CREATE
  get("/items/new", { :controller => "items", :action => "new_form" })
  post("/create_item", { :controller => "items", :action => "create_row" })

  # READ
  get("/items", { :controller => "items", :action => "index" })
  get("/items/:id_to_display", { :controller => "items", :action => "show" })

  # UPDATE
  get("/items/:prefill_with_id/edit", { :controller => "items", :action => "edit_form" })
  post("/update_item/:id_to_modify", { :controller => "items", :action => "update_row" })

  # DELETE
  get("/delete_item/:id_to_remove", { :controller => "items", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
