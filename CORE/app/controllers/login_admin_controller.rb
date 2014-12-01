class LoginAdminController < ApplicationController
  def index
    if !session[:usuario_id].nil?
        flash[:alert] = 'Logado como: aluno ('+session[:usuario]+')'
        redirect_to '/logado' and return
    end
    if !session[:usuario_inativo_id].nil?
        redirect_to '/ativacao' and return
    end
    if !session[:empresa_inativa_id].nil?
        redirect_to '/ativacao' and return
    end
    if !session[:admin_id].nil?
        flash[:alert] = 'Logado como admin'
        redirect_to '/logado' and return
    end
    if !session[:empresa_id].nil?
        flash[:alert] = 'Logado como: empresa ('+session[:empresa]+')'
        redirect_to '/logado' and return
    end
  end

  def login3
    if !session[:usuario_id].nil?
        flash[:alert] = 'Logado como: aluno ('+session[:usuario]+')'
        redirect_to '/logado' and return
    end
    if !session[:usuario_inativo_id].nil?
        redirect_to '/ativacao' and return
    end
    if !session[:empresa_inativa_id].nil?
        redirect_to '/ativacao' and return
    end
    if !session[:admin_id].nil?
        flash[:alert] = 'Logado como admin'
        redirect_to '/logado' and return
    end
    if !session[:empresa_id].nil?
        flash[:alert] = 'Logado como: empresa ('+session[:empresa]+')'
        redirect_to '/logado' and return
    end
  	u = Admin.find_by_username_and_senha(params[:username], Digest::MD5.hexdigest(params[:senha]))
    if u.nil?
        flash[:alert] = 'Username ou senha invalidos'
        render 'index' and return
     else
        session[:admin] = u.username
        session[:admin_id] = u.id
        redirect_to '/alunos' and return
  end
  
  end
  
  def logout3
  	 reset_session
     redirect_to '/login_admin'
  end
end