Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "items#index"
  # Routes for the Category resource:

  # CREATE
  get("/categories/new", { :controller => "categories", :action => "new_form" })
  post("/create_category", { :controller => "categories", :action => "create_row" })

  # READ
  get("/categories", { :controller => "categories", :action => "index" })
  get("/categories/:id_to_display", { :controller => "categories", :action => "show" })

  # UPDATE
  get("/categories/:prefill_with_id/edit", { :controller => "categories", :action => "edit_form" })
  post("/update_category/:id_to_modify", { :controller => "categories", :action => "update_row" })

  # DELETE
  get("/delete_category/:id_to_remove", { :controller => "categories", :action => "destroy_row" })

  #------------------------------

  # Routes for the Comment resource:

  # CREATE
  get("/comments/new", { :controller => "comments", :action => "new_form" })
  post("/create_comment", { :controller => "comments", :action => "create_row" })
  post("/create_comment_from_item", { :controller => "comments", :action => "create_row_from_item" })

  # READ
  get("/comments", { :controller => "comments", :action => "index" })
  get("/comments/:id_to_display", { :controller => "comments", :action => "show" })

  # UPDATE
  get("/comments/:prefill_with_id/edit", { :controller => "comments", :action => "edit_form" })
  post("/update_comment/:id_to_modify", { :controller => "comments", :action => "update_row" })

  # DELETE
  get("/delete_comment/:id_to_remove", { :controller => "comments", :action => "destroy_row" })
  get("/delete_comment_from_item/:id_to_remove", { :controller => "comments", :action => "destroy_row_from_item" })
  get("/delete_comment_from_user/:id_to_remove", { :controller => "comments", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Bookmark resource:

  # CREATE
  get("/bookmarks/new", { :controller => "bookmarks", :action => "new_form" })
  post("/create_bookmark", { :controller => "bookmarks", :action => "create_row" })
  post("/create_bookmark_from_item", { :controller => "bookmarks", :action => "create_row_from_item" })

  # READ
  get("/bookmarks", { :controller => "bookmarks", :action => "index" })
  get("/bookmarks/:id_to_display", { :controller => "bookmarks", :action => "show" })

  # UPDATE
  get("/bookmarks/:prefill_with_id/edit", { :controller => "bookmarks", :action => "edit_form" })
  post("/update_bookmark/:id_to_modify", { :controller => "bookmarks", :action => "update_row" })

  # DELETE
  get("/delete_bookmark/:id_to_remove", { :controller => "bookmarks", :action => "destroy_row" })
  get("/delete_bookmark_from_item/:id_to_remove", { :controller => "bookmarks", :action => "destroy_row_from_item" })
  get("/delete_bookmark_from_user/:id_to_remove", { :controller => "bookmarks", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Transaction resource:

  # CREATE
  get("/transactions/new", { :controller => "transactions", :action => "new_form" })
  post("/create_transaction", { :controller => "transactions", :action => "create_row" })
  post("/create_transaction_from_item", { :controller => "transactions", :action => "create_row_from_item" })

  # READ
  get("/transactions", { :controller => "transactions", :action => "index" })
  get("/transactions/:id_to_display", { :controller => "transactions", :action => "show" })

  # UPDATE
  get("/transactions/:prefill_with_id/edit", { :controller => "transactions", :action => "edit_form" })
  post("/update_transaction/:id_to_modify", { :controller => "transactions", :action => "update_row" })

  # DELETE
  get("/delete_transaction/:id_to_remove", { :controller => "transactions", :action => "destroy_row" })
  get("/delete_transaction_from_item/:id_to_remove", { :controller => "transactions", :action => "destroy_row_from_item" })
  get("/delete_transaction_from_seller/:id_to_remove", { :controller => "transactions", :action => "destroy_row_from_seller" })
  get("/delete_transaction_from_buyer/:id_to_remove", { :controller => "transactions", :action => "destroy_row_from_buyer" })

  #------------------------------

  # Routes for the Status resource:

  # CREATE
  get("/statuses/new", { :controller => "statuses", :action => "new_form" })
  post("/create_status", { :controller => "statuses", :action => "create_row" })

  # READ
  get("/statuses", { :controller => "statuses", :action => "index" })
  get("/statuses/:id_to_display", { :controller => "statuses", :action => "show" })

  # UPDATE
  get("/statuses/:prefill_with_id/edit", { :controller => "statuses", :action => "edit_form" })
  post("/update_status/:id_to_modify", { :controller => "statuses", :action => "update_row" })

  # DELETE
  get("/delete_status/:id_to_remove", { :controller => "statuses", :action => "destroy_row" })

  #------------------------------

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
  post("/create_item_from_category", { :controller => "items", :action => "create_row_from_category" })
  post("/create_item_from_status", { :controller => "items", :action => "create_row_from_status" })
  post("/create_item_from_location", { :controller => "items", :action => "create_row_from_location" })

  # READ
  get("/items", { :controller => "items", :action => "index" })
  get("/items/:id_to_display", { :controller => "items", :action => "show" })

  # UPDATE
  get("/items/:prefill_with_id/edit", { :controller => "items", :action => "edit_form" })
  post("/update_item/:id_to_modify", { :controller => "items", :action => "update_row" })

  # DELETE
  get("/delete_item/:id_to_remove", { :controller => "items", :action => "destroy_row" })
  get("/delete_item_from_item_type/:id_to_remove", { :controller => "items", :action => "destroy_row_from_item_type" })
  get("/delete_item_from_status/:id_to_remove", { :controller => "items", :action => "destroy_row_from_status" })
  get("/delete_item_from_location/:id_to_remove", { :controller => "items", :action => "destroy_row_from_location" })
  get("/delete_item_from_poster/:id_to_remove", { :controller => "items", :action => "destroy_row_from_poster" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
