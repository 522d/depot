require 'concerns/current_cart'
class AdminController < ApplicationController
  include CurrentCart
  before_filter :set_cart, only: [:create]
  before_filter :set_line_item, only: [:show, :edit, :update, :destroy]

 def index
    @cart = Cart.new
    @total_orders = Order.count
  end
end
