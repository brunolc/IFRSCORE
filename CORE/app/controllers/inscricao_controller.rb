class InscricaoController < ApplicationController


	def new
        @vaga = Vaga.new
    end

	def cadastra
		if session[:usuario_id].nil?
			flash[:alert] = 'Voce deve estar logado como usuario para fazer isso'
        	redirect_to 'root'
    	else
    		@inscricao = Inscricao.new
    		@inscricao.aluno = Aluno.find_by_id(session[:usuario_id])
       		@inscricao.vaga = Vaga.find_by_id(params[:id])
        	if @inscricao.save
        		InscricaoAlunoMailer.realizada(@inscricao).deliver
        		InscricaoEmpresaMailer.realizada(@inscricao).deliver
            	redirect_to 'root', notice: "Inscricao realizada"
        	else
            	#
        	end
        end

	end
end
