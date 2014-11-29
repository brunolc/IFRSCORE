require 'digest'
class EmpresasController < ApplicationController

	def index
        @empresas = Empresa.all
    end
    def new
        @empresa = Empresa.new
    end

    def edit
        @empresa = Empresa.find(params[:id])
    end

    def create
        @empresa = Empresa.new(params.require(:empresa).permit(:nome,:cnpj,:endereco,:cidade,:area_atuacao,:senha))
        @empresa.senha=Digest::MD5.hexdigest(@empresa.senha)
        @empresa.valido = false
        @empresa.senha_ativacao = SecureRandom.uuid
        if @empresa.save
            redirect_to :empresas, notice: "Empresa #{@empresa.nome} salvo"
        else
            render :new
        end
    end

    def update
        @empresa = Empresa.find(params[:id])
        if @empresa.update(params.require(:empresa).permit(:nome,:cnpj,:endereco,:cidade,:area_atuacao,:senha))
            redirect_to :empresas, notice: "Empresa #{@empresa.nome} atualizado"
        else
            render :edit
        end
    end


    def destroy
        e = Empresa.find(params[:id])
        e.destroy
        redirect_to :empresas, notice: "Empresa #{e.nome} excluido"
    end

    def show
        @empresa = Empresa.find(params[:id])
    end

end
