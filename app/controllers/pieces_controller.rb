class PiecesController < ApplicationController
  before_filter :set_piece, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authenticate_user!, only: [:index, :show]

  respond_to :html

  def index
    @pieces = Piece.all.sort { |x, y| y.created_at <=> x.created_at }.paginate(:per_page => 10, :page => params[:page]||1)
  end

  def show
    @comment = Comment.new
    @comments = Comment.where(outer_id: @piece.id, genre: 3).includes(:user).sort { |x, y| y.created_at <=> x.created_at }
  end

  def new
    @piece = Piece.new
  end

  def edit
  end

  def create
    @piece = Piece.new(params[:piece].merge(:user_id => current_user.id))
    @piece.save
    respond_with(@piece)
  end

  def update
    @piece.update_attributes(params[:piece].merge(:updated_by => current_user.id))
    respond_with(@piece)
  end

  def destroy
    @piece.destroy
    respond_with(@piece)
  end

  private
  def set_piece
    @piece = Piece.find(params[:id])
  end
end
