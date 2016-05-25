class UsersController < ApplicationController
  before_filter :check_login
  before_filter :set_user, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @users = User.paginate(:per_page => 10, :page => params[:page]||1).order(id: :desc)
  end

  def show
  end

  def edit
  end

  def update
    @user.update_attributes(params[:user])
    respond_with(@user)
  end

  def destroy
    @user.destroy
    respond_with(@user)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def check_login
    redirect_to '/' unless current_user.is_admin?
  end
end
