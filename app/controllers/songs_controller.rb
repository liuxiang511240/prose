class SongsController < ApplicationController
  before_filter :set_song, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authenticate_user!, only: [:index, :show]

  respond_to :html

  def index
    @songs = Song.all.sort { |x, y| y.created_at <=> x.created_at }.paginate(:per_page => 10, :page => params[:page]||1)
  end

  def show
    @comment = Comment.new
    @comments = Comment.where(outer_id: @song.id, genre: 4).includes(:user).sort { |x, y| y.created_at <=> x.created_at }
  end

  def new
    @song = Song.new
  end

  def edit
  end

  def create
    @song = Song.new(params[:song].merge(:user_id => current_user.id))
    @song.save
    respond_with(@song)
  end

  def update
    @song.update_attributes(params[:song].merge(:updated_by => current_user.id))
    respond_with(@song)
  end

  def destroy
    @song.destroy
    respond_with(@song)
  end

  private
  def set_song
    @song = Song.find(params[:id])
  end
end
