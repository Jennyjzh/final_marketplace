class CommentsController < ApplicationController
  def index
    @q = Comment.ransack(params[:q])
    @comments = @q.result(:distinct => true).includes(:user, :item).page(params[:page]).per(10)

    render("comment_templates/index.html.erb")
  end

  def show
    @comment = Comment.find(params.fetch("id_to_display"))

    render("comment_templates/show.html.erb")
  end

  def new_form
    @comment = Comment.new

    render("comment_templates/new_form.html.erb")
  end

  def create_row
    @comment = Comment.new

    @comment.item_id = params.fetch("item_id")
    @comment.user_id = params.fetch("user_id")

    if @comment.valid?
      @comment.save

      redirect_back(:fallback_location => "/comments", :notice => "Comment created successfully.")
    else
      render("comment_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_item
    @comment = Comment.new

    @comment.item_id = params.fetch("item_id")
    @comment.user_id = params.fetch("user_id")

    if @comment.valid?
      @comment.save

      redirect_to("/items/#{@comment.item_id}", notice: "Comment created successfully.")
    else
      render("comment_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @comment = Comment.find(params.fetch("prefill_with_id"))

    render("comment_templates/edit_form.html.erb")
  end

  def update_row
    @comment = Comment.find(params.fetch("id_to_modify"))

    @comment.item_id = params.fetch("item_id")
    @comment.user_id = params.fetch("user_id")

    if @comment.valid?
      @comment.save

      redirect_to("/comments/#{@comment.id}", :notice => "Comment updated successfully.")
    else
      render("comment_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @comment = Comment.find(params.fetch("id_to_remove"))

    @comment.destroy

    redirect_to("/users/#{@comment.user_id}", notice: "Comment deleted successfully.")
  end

  def destroy_row_from_item
    @comment = Comment.find(params.fetch("id_to_remove"))

    @comment.destroy

    redirect_to("/items/#{@comment.item_id}", notice: "Comment deleted successfully.")
  end

  def destroy_row
    @comment = Comment.find(params.fetch("id_to_remove"))

    @comment.destroy

    redirect_to("/comments", :notice => "Comment deleted successfully.")
  end
end
