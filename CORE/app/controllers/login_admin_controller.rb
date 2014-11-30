class LoginAdminController < ApplicationController
  def index
  end

  def login3

  	u = Admin.find_by_username_and_senha(params[:username], Digest::MD5.hexdigest(params[:senha]))
    if u.nil?
        flash[:alert] = 'Username ou senha invalidos'
        render 'index'
     else
        session[:admin] = u.username
        session[:admin_id] = u.id
        redirect_to '/alunos'    
  end
  
  end
  
  def logout3
  	 reset_session
     redirect_to '/login_admin'
  end
end