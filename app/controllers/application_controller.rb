class ApplicationController < ActionController::Base
  protect_from_forgery


def current_editor
	session[:editor]
    end
helper_method :current_editor

end
