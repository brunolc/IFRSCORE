require 'digest'
class LoginEmpresaController < ApplicationController
  def index
  end

  def login2
  		u = Empresa.find_by_cnpj_and_senha(params[:cnpj], Digest::MD5.hexdigest(params[:senha]))
    if u.nil?
        flash[:alert] = 'Nome ou senha invalidos'
        render 'index'
    else
        session[:empresa] = u.nome
        session[:empresa_id] = u.id
        redirect_to '/empresas'
    end
  end
  
    def logout2
     reset_session
     redirect_to '/empresas'
  end

end
