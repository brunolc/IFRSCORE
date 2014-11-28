class VagasController < ApplicationController
    def index
        @vagas = Vaga.all
    end
  def new
        @vaga = Vaga.new
    end

    def edit
        @vaga = Vaga.find(params[:id])
    end

    def create
        @vaga = Vaga.new(params.require(:vaga).permit(:descricao,:numero))
        @vaga.empresa=Empresa.find_by_id(session[:empresa_id])
        @vaga.aberta = true;
        if @vaga.save
            redirect_to :vagas, notice: "Vaga salva"
        else
            render :new
        end
    end

    def update
        @vaga = Vaga.find(params[:id])
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
    end

   

end