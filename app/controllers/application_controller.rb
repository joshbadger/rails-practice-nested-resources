class ApplicationController < ActionController::Base
  @passenger
  protect_from_forgery with: :exception
end
