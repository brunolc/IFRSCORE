class VagasController < ApplicationController
    def index
        @cursos =Curso.all
        if params[:filtro].to_i != 0
            @filtro = params[:filtro]
            @vagas = Vaga.where(curso_id: @filtro.to_i)
        elsif params[:filtro].nil? or params[:filtro].to_i == 0
            @vagas = Vaga.all
        end
        if !session[:usuario_inativo_id].nil? or !session[:empresa_inativa_id].nil?
            redirect_to '/ativar' and return
        end
        if !session[:usuario_id].nil? or !session[:empresa_id].nil? or !session[:admin_id].nil?
            if !session[:usuario_id].nil?
                render layout: 'aluno'
            elsif !session[:empresa_id].nil?
                render layout: 'empresa'
            elsif !session[:admin_id].nil?
                render layout: 'admin'
            end
        else
            redirect_to '/erro_sessao' and return
        end
    end

  def new
        if !session[:usuario_inativo_id].nil? or !session[:empresa_inativa_id].nil?
            redirect_to '/ativar' and return
        end
        if session[:empresa_id].nil?
            redirect_to '/erro_sessao' and return
        end
        @vaga = Vaga.new
        @cursos =Curso.all
        render layout: 'empresa'
    end

    def edit
        if !session[:usuario_inativo_id].nil? or !session[:empresa_inativa_id].nil?
            redirect_to '/ativar' and return
        end
        if session[:usuario_id].nil?
            flash[:alert] = 'Logado como: aluno ('+session[:usuario]+')'
            redirect_to '/logado' and return
        end
        if (!session[:empresa_id].nil? and session[:empresa_id] != params[:id].to_i) or !session[:admin_id].nil?
            redirect_to '/erro_sessao' and return
        elsif (!session[:empresa_id].nil? and session[:empresa_id] == params[:id].to_i)
            @vaga = Vaga.find(params[:id])
            @cursos =Curso.all
            render layout: 'empresa'
        end
    end

    def create
        if !session[:usuario_inativo_id].nil? or !session[:empresa_inativa_id].nil?
            redirect_to '/ativar' and return
        end
        if !session[:usuario_id].nil?
            flash[:alert] = 'Logado como: aluno ('+session[:usuario]+')'
            redirect_to '/logado' and return
        end
        if !session[:admin_id].nil?
            flash[:alert] = 'Logado como admin'
            redirect_to '/logado' and return
        end
        if session[:empresa_id].nil?
            redirect_to '/erro_sessao' and return
        end
        @vaga = Vaga.new(params.require(:vaga).permit(:descricao,:numero))
        @vaga.empresa=Empresa.find_by_id(session[:empresa_id])
        @vaga.aberta = true
        @vaga.curso=Curso.find_by_nome(params[:curso])
        if @vaga.save
            @alunos = Aluno.where(ativo: true)
            @alunos.each do |a|
                InscricaoAlunoMailer.novaVaga(@vaga, a).deliver
            end
            redirect_to :vagas, notice: "Vaga salva" and return
        else
            render :new
        end
    end

    def update
        if !session[:usuario_inativo_id].nil? or !session[:empresa_inativa_id].nil?
            redirect_to '/ativar' and return
        end
        if !session[:usuario_id].nil?
            flash[:alert] = 'Logado como: aluno ('+session[:usuario]+')'
            redirect_to '/logado' and return
        end
        if !session[:admin_id].nil?
            flash[:alert] = 'Logado como admin'
            redirect_to '/logado' and return
        end
        if session[:empresa_id].nil?
            redirect_to '/erro_sessao' and return
        end
        if (!session[:empresa_id].nil? and session[:empresa_id] != params[:id].to_i)
            redirect_to '/erro_sessao' and return
        end
        @vaga = Vaga.find(params[:id])
        @vaga.curso=Curso.find_by_nome(params[:curso])
        if @vaga.update(params.require(:vaga).permit(:descricao,:numero))
            redirect_to :vagas, notice: "Vaga atualizada" and return
        else
            render :edit
        end
    end


    def destroy
        if !session[:usuario_inativo_id].nil? or !session[:empresa_inativa_id].nil?
            redirect_to '/ativar' and return
        end
        if session[:admin_id].nil?
            redirect_to '/erro_sessao' and return
        end
        v = Vaga.find(params[:id])
        v.destroy
        redirect_to :vagas, notice: "Vaga excluida"
    end

    def show
        if !session[:usuario_inativo_id].nil? or !session[:empresa_inativa_id].nil?
            redirect_to '/ativar' and return
        end
        @vaga = Vaga.find(params[:id])
        @empresa = Empresa.find_by_id(@vaga.empresa)
        @cursos =Curso.find(@vaga.curso)
        inscricoes = Inscricao.where(vaga_id: @vaga.id)
        @alunos = Array.new
        inscricoes.each do |i|
            @alunos << Aluno.find(i.aluno)
        end
        if !session[:usuario_id].nil? or !session[:empresa_id].nil? or !session[:admin_id].nil?
            if !session[:usuario_id].nil?
                render layout: 'usuario'
            elsif !session[:empresa_id].nil?
                render layout: 'empresa'
            elsif !session[:admin_id].nil?
                render layout: 'admin'
            end
        else
            redirect_to '/erro_sessao' and return
        end
    end

    def fechar
        if !session[:usuario_inativo_id].nil? or !session[:empresa_inativa_id].nil?
            redirect_to '/ativar' and return
        end
        if !session[:usuario_id].nil?
            redirect_to '/erro_sessao' and return
        end
        if !session[:admin_id].nil?
            redirect_to '/erro_sessao' and return
        end
        if session[:empresa_id].nil?
            redirect_to '/erro_sessao' and return
        end
        vaga = Vaga.find(params[:id])
        empresa = Empresa.find(vaga.empresa)
        if empresa.id == session[:empresa_id]
            vaga.aberta = false
            if vaga.save
                redirect_to :vagas, notice: "Vaga fechada a inscricoes"
            else
                redirect_to :vagas, notice: "Ocorreu um erro, a vaga nao pode ser fechada"
            end
        else
            redirect_to '/erro_sessao' and return
        end
    end

   

end