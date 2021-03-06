class CurriculosController < ApplicationController
    def editar_curriculo
        if session[:usuario_id].nil?
            redirect_to '/erro_sessao'
        else
            @curriculo = Curriculo.find_by_aluno_id(session[:usuario_id])
        end
    end

    def edit_curriculo
    	if session[:usuario_id].nil?
            redirect_to '/erro_sessao' and return
        else
    		@c = Curriculo.find_by_aluno_id(session[:usuario_id])
    		@c.aluno = Aluno.find(session[:usuario_id])
    		st = params.require(:curriculo).permit(:nascimento).to_s
    		@c.nascimento = st
    		if @c.update(params.require(:curriculo).permit(:nome,:estado_civil,:endereco,:bairro,:cidade,:cep,:uf,:telefone,:celular,:rg,:cpf,:cnh,:formacao_tecnica_curso,:formacao_tecnica_periodo,:formacao_tecnica_entidade,:formacao_tecnica_cidade,:formacao_tecnica_uf,:formacao_superior_curso,:formacao_superior_periodo,:formacao_superior_entidade,:formacao_superior_cidade,:formacao_superior_uf,:formacao_outra_curso,:formacao_outra_periodo,:formacao_outra_entidade,:formacao_outra_cidade,:formacao_outra_uf,:experiencia_empresa_1,:experiencia_funcao_1,:experiencia_inicio_1,:experiencia_fim_1,:experiencia_empresa_2,:experiencia_funcao_2,:experiencia_inicio_2,:experiencia_fim_2,:experiencia_empresa_3,:experiencia_funcao_3,:experiencia_inicio_3,:experiencia_fim_3,:experiencia_empresa_4,:experiencia_funcao_4,:experiencia_inicio_4,:experiencia_fim_4,:experiencia_empresa_5,:experiencia_funcao_5,:experiencia_inicio_5,:experiencia_fim_5,:cursos))
    			redirect_to :alunos, notice: "Curriculo atualizado"
    		else
    			redirect_to '/perfil/curriculo' and return
    		end
    	end
    end

    def mostrar
        if !session[:usuario_inativo_id].nil? or !session[:empresa_inativa_id].nil?
            redirect_to '/ativar' and return
        end
        if !session[:empresa_id].nil? or !session[:admin_id].nil? or session[:usuario_id] == params[:id].to_i
            respond_to do |format|
                format.html do
                    redirect_to '/curriculo/mostrar/' + params[:id] + '.pdf' and return
                    #@curriculo = Curriculo.find_by_aluno_id(params[:id])
                end
                format.pdf do
                    @curriculo = Curriculo.find_by_aluno_id(params[:id])
                    if !@curriculo.nil?
                     #   string = "Currículo de " + @curriculo.nome
                        render :pdf => "Curriculo", header: {center: "CURRICULO"}, 
                        footer: { center: "[page] of [topage]"}
                    else
                        redirect_to '/erro_404' and return
                    end
                end
            end
        else
            redirect_to '/erro_sessao' and return
        end

    end
        
end
