class ItemsController < ApplicationController
  before_action :current_user_must_be_item_poster, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_item_poster
    item = Item.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == item.poster
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Item.ransack(params[:q])
    @items = @q.result(:distinct => true).includes(:poster, :transactions, :comments, :bookmarks, :location, :status, :item_type).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@items.where.not(:address_latitude => nil)) do |item, marker|
      marker.lat item.address_latitude
      marker.lng item.address_longitude
      marker.infowindow "<h5><a href='/items/#{item.id}'>#{item.title}</a></h5><small>#{item.address_formatted_address}</small>"
    end

    render("item_templates/index.html.erb")
  end

  def show
    @bookmark = Bookmark.new
    @comment = Comment.new
    @transaction = Transaction.new
    @item = Item.find(params.fetch("id_to_display"))

    render("item_templates/show.html.erb")
  end

  def new_form
    @item = Item.new

    render("item_templates/new_form.html.erb")
  end

  def create_row
    @item = Item.new

    @item.title = params.fetch("title")
    @item.description = params.fetch("description")
    @item.seller_id = params.fetch("seller_id")
    @item.price = params.fetch("price")
    @item.address = params.fetch("address")
    @item.photo = params.fetch("photo") if params.key?("photo")
    @item.location_id = params.fetch("location_id")
    @item.status_id = params.fetch("status_id")
    @item.item_type_id = params.fetch("item_type_id")

    if @item.valid?
      @item.save

      redirect_back(:fallback_location => "/items", :notice => "Item created successfully.")
    else
      render("item_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_location
    @item = Item.new

    @item.title = params.fetch("title")
    @item.description = params.fetch("description")
    @item.seller_id = params.fetch("seller_id")
    @item.price = params.fetch("price")
    @item.address = params.fetch("address")
    @item.photo = params.fetch("photo") if params.key?("photo")
    @item.location_id = params.fetch("location_id")
    @item.status_id = params.fetch("status_id")
    @item.item_type_id = params.fetch("item_type_id")

    if @item.valid?
      @item.save

      redirect_to("/locations/#{@item.location_id}", notice: "Item created successfully.")
    else
      render("item_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_status
    @item = Item.new

    @item.title = params.fetch("title")
    @item.description = params.fetch("description")
    @item.seller_id = params.fetch("seller_id")
    @item.price = params.fetch("price")
    @item.address = params.fetch("address")
    @item.photo = params.fetch("photo") if params.key?("photo")
    @item.location_id = params.fetch("location_id")
    @item.status_id = params.fetch("status_id")
    @item.item_type_id = params.fetch("item_type_id")

    if @item.valid?
      @item.save

      redirect_to("/statuses/#{@item.status_id}", notice: "Item created successfully.")
    else
      render("item_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_category
    @item = Item.new

    @item.title = params.fetch("title")
    @item.description = params.fetch("description")
    @item.seller_id = params.fetch("seller_id")
    @item.price = params.fetch("price")
    @item.address = params.fetch("address")
    @item.photo = params.fetch("photo") if params.key?("photo")
    @item.location_id = params.fetch("location_id")
    @item.status_id = params.fetch("status_id")
    @item.item_type_id = params.fetch("item_type_id")

    if @item.valid?
      @item.save

      redirect_to("/categories/#{@item.item_type_id}", notice: "Item created successfully.")
    else
      render("item_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @item = Item.find(params.fetch("prefill_with_id"))

    render("item_templates/edit_form.html.erb")
  end

  def update_row
    @item = Item.find(params.fetch("id_to_modify"))

    @item.title = params.fetch("title")
    @item.description = params.fetch("description")
    
    @item.price = params.fetch("price")
    @item.address = params.fetch("address")
    @item.photo = params.fetch("photo") if params.key?("photo")
    @item.location_id = params.fetch("location_id")
    @item.status_id = params.fetch("status_id")
    @item.item_type_id = params.fetch("item_type_id")

    if @item.valid?
      @item.save

      redirect_to("/items/#{@item.id}", :notice => "Item updated successfully.")
    else
      render("item_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_poster
    @item = Item.find(params.fetch("id_to_remove"))

    @item.destroy

    redirect_to("/users/#{@item.seller_id}", notice: "Item deleted successfully.")
  end

  def destroy_row_from_location
    @item = Item.find(params.fetch("id_to_remove"))

    @item.destroy

    redirect_to("/locations/#{@item.location_id}", notice: "Item deleted successfully.")
  end

  def destroy_row_from_status
    @item = Item.find(params.fetch("id_to_remove"))

    @item.destroy

    redirect_to("/statuses/#{@item.status_id}", notice: "Item deleted successfully.")
  end

  def destroy_row_from_item_type
    @item = Item.find(params.fetch("id_to_remove"))

    @item.destroy

    redirect_to("/categories/#{@item.item_type_id}", notice: "Item deleted successfully.")
  end

  def destroy_row
    @item = Item.find(params.fetch("id_to_remove"))

    @item.destroy

    redirect_to("/items", :notice => "Item deleted successfully.")
  end
end
