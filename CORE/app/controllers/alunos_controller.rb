require 'digest'
class AlunosController < ApplicationController
    def index
        @alunos = Aluno.all
    end
  def new
        @aluno = Aluno.new
    end

    def edit
        @aluno = Aluno.find(params[:id])
    end

    def create
        @aluno = Aluno.new(params.require(:aluno).permit(:matricula,:nome,:email,:senha))
        @aluno.senha = Digest::MD5.hexdigest(@aluno.senha)  
        @aluno.ativo = false  
        @aluno.senha_ativacao = SecureRandom.uuid
        if @aluno.save
            redirect_to :alunos, notice: "Aluno #{@aluno.nome} salvo"
        else
            render :new
        end
    end

    def update
        @aluno = Aluno.find(params[:id])
        if @aluno.update(params.require(:aluno).permit(:matricula,:nome,:email,:senha))
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
    end

   

end
