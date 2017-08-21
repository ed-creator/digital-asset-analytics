class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def dashboard
  end

  def current_digital_asset
    @current_digital_asset ||= DigitalAsset.find(session[:current_digital_asset_id])
  end

  def logged_in?
    current_digital_asset != nil
  end


  helper_method :current_digital_asset, :logged_in?

end
