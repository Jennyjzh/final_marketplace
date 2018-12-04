class ItemsController < ApplicationController
  def index
    @items = Item.all

    render("item_templates/index.html.erb")
  end

  def show
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
    @item.photo = params.fetch("photo")
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

  def edit_form
    @item = Item.find(params.fetch("prefill_with_id"))

    render("item_templates/edit_form.html.erb")
  end

  def update_row
    @item = Item.find(params.fetch("id_to_modify"))

    @item.title = params.fetch("title")
    @item.description = params.fetch("description")
    @item.seller_id = params.fetch("seller_id")
    @item.price = params.fetch("price")
    @item.address = params.fetch("address")
    @item.photo = params.fetch("photo")
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

  def destroy_row
    @item = Item.find(params.fetch("id_to_remove"))

    @item.destroy

    redirect_to("/items", :notice => "Item deleted successfully.")
  end
end
