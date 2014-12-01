require 'digest'
class AlunosController < ApplicationController
    def index
        @alunos = Aluno.all
        render layout: 'admin'
    end
   
    def new
        @aluno = Aluno.new
        @cursos =Curso.all
    end

    def edit
         @aluno = Aluno.find(params[:id])
         @cursos =Curso.all
    end


    def create
        @aluno = Aluno.new(params.require(:aluno).permit(:matricula,:nome,:email,:senha))
        @aluno.senha = Digest::MD5.hexdigest(@aluno.senha)  
        @aluno.ativo = false  
        @aluno.senha_ativacao = SecureRandom.uuid
         @aluno.curso=Curso.find_by_nome(params[:curso])
        if @aluno.save
            InscricaoAlunoMailer.cadastro(@aluno).deliver
            @curriculo = Curriculo.new
            @curriculo.aluno = Aluno.find(@aluno)
            @curriculo.save(:validate => false)
            redirect_to :alunos, notice: "Aluno #{@aluno.nome} salvo"
        else
            render :new
        end
    end

    def update
        @aluno = Aluno.find(params[:id])
        @aluno.senha = Digest::MD5.hexdigest(params[:aluno][:senha])  
        @aluno.curso=Curso.find_by_nome(params[:curso])
        if @aluno.update(params.require(:aluno).permit(:matricula,:nome,:email))
            redirect_to :alunos, notice: "Aluno #{@aluno.nome} atualizado"
        else
            render :edit
        end
    end


    def destroy
        a = Aluno.find(params[:id])
        a.destroy
        redirect_to :alunos, notice: "Aluno #{a.nome} excluido"
    end

    def show
        @aluno = Aluno.find(params[:id])
        @cursos=Curso.find(@aluno.curso)
    end  
end
