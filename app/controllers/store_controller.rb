
require 'concerns/current_cart'
class StoreController < ApplicationController
  skip_before_filter :authorize
include CurrentCart
before_filter :set_cart
  def index
    @products = Product.order(:title)
  end
end
