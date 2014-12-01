class ErrosController < ApplicationController
  def logado
	if flash.empty?
		if !session[:usuario_id].nil?
	        flash[:alert] = 'Logado como: aluno ('+session[:usuario]+')'
	    end
	    if !session[:usuario_inativo_id].nil?
	        redirect_to '/ativar' and return
	    end
	    if !session[:empresa_inativa_id].nil?
	        redirect_to '/ativar' and return
	    end
	    if !session[:admin_id].nil?
	        flash[:alert] = 'Logado como admin'
	    end
	    if !session[:empresa_id].nil?
	        flash[:alert] = 'Logado como: empresa ('+session[:empresa]+')'
	    end
	end
  end

  def erro_sessao
  end

  def erro_404
  end
end
