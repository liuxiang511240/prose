class CommentsController < ApplicationController
  before_filter :set_comment, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authenticate_user!, only: [:index, :show]
  
  respond_to :html
  
  def index
    @comments = Comment.paginate(:per_page => 10, :page => params[:page]||1).order(id: :desc)
  end
  
  def show
  end
  
  def new
    @comment = Comment.new
  end
  
  def edit
  end
  
  def create
    @comment = Comment.new(params[:comment].merge(:user_id => current_user.id))
    @comment.save
    flash[:comment_notice] = @comment.errors.full_messages.join('<br>')
    if @comment.genre==1
      redirect_to "/poetries/#{@comment.outer_id}"
    elsif @comment.genre==2
      redirect_to "/proses/#{@comment.outer_id}"
    elsif @comment.genre==3
      redirect_to "/pieces/#{@comment.outer_id}"
    else
      redirect_to "/songs/#{@comment.outer_id}"
    end
  end
  
  def update
    @comment.update_attributes(params[:comment])
    respond_with(@comment)
  end
  
  def destroy
    @comment.destroy
    respond_with(@comment)
  end
  
  private
  def set_comment
    @comment = Comment.find(params[:id])
  end
end
