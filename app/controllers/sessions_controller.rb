require 'concerns/current_cart'

class SessionsController < ApplicationController
  skip_before_filter :authorize
  include CurrentCart
  before_filter :set_cart, only: [:create]
  before_filter :set_line_item, only: [:show, :edit, :update, :destroy]


  def new
    @cart = Cart.new
  end


  def create
    @cart = Cart.new
    @user = User.find_by_name(params[:name])
    if @user and @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy 
    session[:user_id] = nil
    redirect_to store_url, notice: "Logged out"
  end

  def delete
    session[:user_id] = nil
    redirect_to store_url, notice: "Logged out"
  end

end
