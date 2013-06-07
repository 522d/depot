require 'concerns/current_cart'
class ApplicationController < ActionController::Base

  before_filter :set_i18n_locale_from_params
  include CurrentCart
  before_filter :set_cart, only: [:create]
  before_filter :set_line_item, only: [:show, :edit, :update, :destroy] 
  protect_from_forgery
  protected
  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, notice: "Please log in"
    end
  end
  def set_i18n_locale_from_params
    if params[:locale]
      if I18n.availbale_locales.include?(params[:locale].to_sym)
        I18n.locale = params[:locale]
      else
        flash.now[:notice] = 
          "#{params[:locale]} translation not available"
        logger.error flash.now[:notice]
      end
    end
  end

  def default_url_optioms
    {locale: I18n.locale}
  end
end
