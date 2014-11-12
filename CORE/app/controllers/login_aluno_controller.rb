require 'digest'
class LoginAlunoController < ApplicationController
  def index
  end

  def login
  		u = Aluno.find_by_matricula_and_senha(params[:matricula], Digest::MD5.hexdigest(params[:senha]))
    if u.nil?
        flash[:alert] = 'Nome ou matricula invalidos'
        render 'index'
     else
        session[:usuario] = u.nome
        redirect_to '/alunos'    
    end
  end  

  def logout
  	 reset_session
     redirect_to '/alunos'
  end


end
