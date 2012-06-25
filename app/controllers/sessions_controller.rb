class SessionsController < ApplicationController

  def new
  end
  def create
	editor = Editor.authenticate(params[:session][:email],params[:session][:password])
	if editor.nil?
		
		redirect_to :controller => 'articles',:action=>'index', notice: "Invalid email/password combo"
	else
		session[:remember_token] = editor.id
		session[:editor_id]= editor.id
		redirect_to :controller => 'home',:action=>'index'
	end
  end
  def destroy
	session[:remember_token] = nil
	redirect_to :controller => 'home', :action=>'index'
  end

  def current_editor
    @_current_editor ||= session[:current_editor_id] && Editor.find(session[:current_editor_id])
  end
end
