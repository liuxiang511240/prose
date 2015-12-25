class PoetriesController < ApplicationController
  before_filter :set_poetry, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authenticate_user!, only: [:index, :show]

  respond_to :html

  def index
    @poetries = Poetry.all.sort { |x, y| y.created_at <=> x.created_at }.paginate(:page => params[:page]||1, :per_page => 10)
  end

  def show
    @comment = Comment.new
    @comments = Comment.where(outer_id: @poetry.id, genre: 1).includes(:user).sort { |x, y| y.created_at <=> x.created_at }
  end

  def new
    @poetry = Poetry.new
  end

  def edit
  end

  def create
    @poetry = Poetry.new(params[:poetry].merge(:user_id => current_user.id))
    @poetry.save
    respond_with(@poetry)
  end

  def update
    @poetry.update_attributes(params[:poetry].merge(:updated_by => current_user.id))
    respond_with(@poetry)
  end

  def destroy
    @poetry.destroy
    @poetry
    respond_with(@poetry)
  end

  private
  def set_poetry
    @poetry = Poetry.find(params[:id])
  end
end
