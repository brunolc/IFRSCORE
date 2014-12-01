class VagasController < ApplicationController
    def index
        @cursos =Curso.all
        if params[:filtro].to_i != 0
            @filtro = params[:filtro]
            @vagas = Vaga.where(curso_id: @filtro.to_i)
        elsif params[:filtro].nil? or params[:filtro].to_i == 0
            @vagas = Vaga.all
        end
        
        #render layout: 'empresa' #layout bugando o código, precisa estar dentro de um bloco if
        # arrumar depois ^
    end

  def new
        @vaga = Vaga.new
        @cursos =Curso.all
    end

    def edit
        @vaga = Vaga.find(params[:id])
         @cursos =Curso.all
    end

    def create
        @vaga = Vaga.new(params.require(:vaga).permit(:descricao,:numero))
        @vaga.empresa=Empresa.find_by_id(session[:empresa_id])
        @vaga.aberta = true
        @vaga.curso=Curso.find_by_nome(params[:curso])
        if @vaga.save
            @alunos = Aluno.where(ativo: true)
            @alunos.each do |a|
                InscricaoAlunoMailer.novaVaga(@vaga, a).deliver
            end
            redirect_to :vagas, notice: "Vaga salva"
        else
            render :new
        end
    end

    def update
        @vaga = Vaga.find(params[:id])
        @vaga.curso=Curso.find_by_nome(params[:curso])
        if @vaga.update(params.require(:vaga).permit(:descricao,:numero))
            redirect_to :vagas, notice: "Vaga atualizada"
        else
            render :edit
        end
    end


    def destroy
        v = Vaga.find(params[:id])
        v.destroy
        redirect_to :vagas, notice: "Vaga excluida"
    end

    def show
        @vaga = Vaga.find(params[:id])
        @empresa = Empresa.find_by_id(@vaga.empresa)
        @cursos =Curso.find(@vaga.curso)
        inscricoes = Inscricao.where(vaga_id: @vaga.id)
        @alunos = Array.new
        inscricoes.each do |i|
            @alunos << Aluno.find(i.aluno)
        end
    end

   

end