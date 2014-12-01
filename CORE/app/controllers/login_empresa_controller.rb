require 'digest'
class LoginEmpresaController < ApplicationController
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

  def login2
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
  	u = Empresa.find_by_cnpj_and_senha(params[:cnpj], Digest::MD5.hexdigest(params[:senha]))
    if u.nil?
        flash[:alert] = 'Nome ou senha invalidos'
        render 'index' and return
    else
        if u.ativo == true
          session[:empresa] = u.nome
          session[:empresa_id] = u.id
          redirect_to '/vagas' and return
        else
          session[:empresa_inativa] = u.nome
          session[:empresa_inativa_id] = u.id
          redirect_to '/ativacao' and return
        end
    end
  end
  
    def logout2
     reset_session
     redirect_to '/login_empresa'
  end

end
