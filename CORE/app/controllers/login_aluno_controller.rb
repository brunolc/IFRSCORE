require 'digest'
class LoginAlunoController < ApplicationController
  def index
    if !session[:usuario_id].nil?
        flash[:alert] = 'Logado como: aluno ('+session[:usuario]+')'
        redirect_to '/logado' and return
    end
    if !session[:usuario_inativo_id].nil?
        redirect_to '/ativar' and return
    end
    if !session[:empresa_inativa_id].nil?
        redirect_to '/ativar' and return
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

  def login
    if !session[:usuario_id].nil?
        flash[:alert] = 'Logado como: aluno ('+session[:usuario]+')'
        redirect_to '/logado' and return
    end
    if !session[:usuario_inativo_id].nil?
        redirect_to '/ativar' and return
    end
    if !session[:empresa_inativa_id].nil?
        redirect_to '/ativar' and return
    end
    if !session[:admin_id].nil?
        flash[:alert] = 'Logado como admin'
        redirect_to '/logado' and return
    end
    if !session[:empresa_id].nil?
        flash[:alert] = 'Logado como: empresa ('+session[:empresa]+')'
        redirect_to '/logado' and return
    end
  		u = Aluno.find_by_matricula_and_senha(params[:matricula], Digest::MD5.hexdigest(params[:senha]))
    if u.nil?
        flash[:alert] = 'Nome ou matricula invalidos'
        render 'index' and return
     else
        if u.ativo == true
          session[:usuario] = u.nome
          session[:usuario_id] = u.id
          redirect_to '/vagas' and return   
        else
          session[:usuario_inativo] = u.nome
          session[:usuario_inativo_id] = u.id
          redirect_to '/ativar' and return
        end
    end
  end  

  def logout
  	 reset_session
     redirect_to '/login'
  end

end
