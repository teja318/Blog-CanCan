class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from CanCan: :AcessDenined do 
  	redirect_to :root_path, notice: "page not found"
  	
  end
end
