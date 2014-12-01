class ErrosController < ApplicationController
  def logado
	if flash.empty?
		if !session[:usuario_id].nil?
	        flash[:alert] = 'Logado como: aluno ('+session[:usuario]+')'
	         render layout: 'aluno'
	    end
	    if !session[:usuario_inativo_id].nil?
	        redirect_to '/ativar' and return
	    end
	    if !session[:empresa_inativa_id].nil?
	        redirect_to '/ativar' and return
	    end
	    if !session[:admin_id].nil?
	        flash[:alert] = 'Logado como admin'
	        render layout: 'admin'
	    end
	    if !session[:empresa_id].nil?
	        flash[:alert] = 'Logado como: empresa ('+session[:empresa]+')'
            render layout: 'empresa'
	    end

	end
  end

  def erro_sessao
  end

  def erro_404
  end
end
