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
        redirect_to '/empresas'
    end
  end

end
