class AtivarController < ApplicationController
    def valida
        #/ativar/id
        @usuario = Array.new
        @usuario << Empresa.find_by_senha_ativacao(params[:id])
        if !@usuario[0].nil?
        	puts ">>>>>>>>>> entrando 1 if"
            if !session[:admin_id].nil?
                @usuario[0].valido = true
                if @usuario[0].save
                    flash[:alert] = 'Validação realizada com sucesso'
                    redirect_to '/' and return
                else
                    flash[:alert] = 'Erro na validação, tente novamente'
                    redirect_to '/' and return
                end
            elsif !session[:usuario_id].nil? or !session[:empresa_id].nil?
                flash[:alert] = 'Você deve estar logado como admin para fazer isso'
                redirect_to '/logado' and return
            else
                flash[:alert] = 'Você deve estar logado como admin para fazer isso'
                redirect_to '/login' and return
            end
        else
            @usuario << Aluno.find_by_senha_ativacao(params[:id])
            if @usuario[1].nil?
            		flash[:alert] = 'Link inválido'
	                redirect_to '/' and return
	        else
	        	@usuario[1].ativo = true
	            if @usuario[1].save
	                flash[:alert] = 'Validação realizada com sucesso'
	                session[:usuario_id] = @usuario[1].id
	                session[:usuario] = @usuario[1].nome
	                redirect_to '/alunos' and return #temporário, deve redirecionar para /vagas
	            else
	                flash[:alert] = 'Erro na validação, tente novamente'
	                redirect_to '/' and return
	            end
	        end
        end
    end

  def index

  end
end
