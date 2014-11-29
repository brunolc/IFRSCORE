class VagasController < ApplicationController
    def index
        @vagas = Vaga.all
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
    end

   

end