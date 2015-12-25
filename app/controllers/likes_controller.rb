class LikesController < ApplicationController
  # before_filter :set_like, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authenticate_user!, only: [:index, :show]
  
  respond_to :html
  
  def index
    @likes = Like.all.sort { |x, y| y.created_at <=> x.created_at }.paginate(:per_page => 10, :page => params[:page]||1)
  end
  
  def show
  end
  
  def new
    @like = Like.new
  end
  
  def edit
    @like = Like.new(:user_id => current_user.id, :outer_id => params[:id], :genre => params[:genre])
    @like.save
    flash[:notice] = @like.errors.full_messages.join('<br>')
    if @like.genre==1
      redirect_to "/poetries/#{@like.outer_id}"
    elsif @like.genre==2
      redirect_to "/proses/#{@like.outer_id}"
    elsif @like.genre==3
      redirect_to "/pieces/#{@like.outer_id}"
    else
      redirect_to "/songs/#{@like.outer_id}"
    end
  end
  
  def create
    @like = Like.new(params[:like].merge(:user_id => current_user.id))
    @like.save
    flash[:notice] = @like.errors.full_messages.join('<br>')
    if @like.genre==1
      redirect_to "/poetries/#{@like.outer_id}"
    elsif @like.genre==2
      redirect_to "/proses/#{@like.outer_id}"
    elsif @like.genre==3
      redirect_to "/pieces/#{@like.outer_id}"
    else
      redirect_to "/songs/#{@like.outer_id}"
    end
  end
  
  def update
    @like.update_attributes(params[:like])
    respond_with(@like)
  end
  
  def destroy
    @like.destroy
    respond_with(@like)
  end
end
