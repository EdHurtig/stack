class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  
  def protect_against_forgery?
    ( request.get? or request.head? ) and not request.format.json?
  end

end
