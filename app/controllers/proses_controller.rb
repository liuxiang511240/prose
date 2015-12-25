class ProsesController < ApplicationController
  before_filter :set_prose, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authenticate_user!, only: [:index, :show]

  respond_to :html

  def index
    @proses = Prose.all.sort { |x, y| y.created_at <=> x.created_at }.paginate(:per_page => 10, :page => params[:page]||1)
  end

  def show
    @comment = Comment.new
    @comments = Comment.where(outer_id: @prose.id, genre: 2).includes(:user).sort { |x, y| y.created_at <=> x.created_at }
  end

  def new
    @prose = Prose.new
  end

  def edit
  end

  def create
    @prose = Prose.new(params[:prose].merge(:user_id => current_user.id))
    @prose.save
    respond_with(@prose)
  end

  def update
    @prose.update_attributes(params[:prose].merge(:updated_by => current_user.id))
    respond_with(@prose)
  end

  def destroy
    @prose.destroy
    respond_with(@prose)
  end

  private
  def set_prose
    @prose = Prose.find(params[:id])
  end
end
