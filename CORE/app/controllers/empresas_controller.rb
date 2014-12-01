require 'digest'
class EmpresasController < ApplicationController

	def index
        if !session[:usuario_inativo_id].nil? or !session[:empresa_inativa_id].nil?
            redirect_to '/ativar' and return
        end
        if !session[:usuario_id].nil?
            flash[:alert] = 'Logado como: aluno ('+session[:usuario]+')'
            redirect_to '/logado' and return
        end
        if !session[:empresa_id].nil?
            flash[:alert] = 'Logado como: empresa ('+session[:empresa]+')'
            redirect_to '/logado' and return
        end
        if !session[:admin_id].nil?
            @empresas = Empresa.all
            render layout: 'admin'
        else
            redirect_to 'erro_sessao' and return
        end
    end
    def new
        if !session[:usuario_inativo_id].nil? or !session[:empresa_inativa_id].nil?
            redirect_to '/ativar' and return
        end
        if !session[:usuario_id].nil?
            flash[:alert] = 'Logado como: aluno ('+session[:usuario]+')'
            redirect_to '/logado' and return
        end
        if !session[:empresa_id].nil?
            flash[:alert] = 'Logado como: empresa ('+session[:empresa]+')'
            redirect_to '/logado' and return
        end
        if session[:empresa_id].nil?
            @empresa = Empresa.new
            if !session[:admin_id].nil?
                render layout: 'admin'
            end
        end

    end

    def edit
        if !session[:usuario_inativo_id].nil? or !session[:empresa_inativa_id].nil?
            redirect_to '/ativar' and return
        end
        if !session[:usuario_id].nil?
            flash[:alert] = 'Logado como: usuario ('+session[:usuario]+')'
            redirect_to '/logado' and return
        end
        if (!session[:empresa_id].nil? and session[:empresa_id] != params[:id].to_i) or (session[:empresa_id].nil? and session[:admin_id].nil?)
            redirect_to '/erro_sessao' and return
        else
            @empresa = Empresa.find(params[:id])
            if !session[:admin_id].nil?
                render layout: 'admin'
            else
                render layout: 'empresa'
        end
    end

    def create
         if !session[:usuario_inativo_id].nil? or !session[:empresa_inativa_id].nil?
            redirect_to '/ativar' and return
        end
        if !session[:empresa_id].nil?
            flash[:alert] = 'Logado como: empresa ('+session[:empresa]+')'
            redirect_to '/logado' and return
        end
        if !session[:usuario_id].nil?
            flash[:alert] = 'Logado como: aluno ('+session[:usuario]+')'
            redirect_to '/logado' and return
        end
        @empresa = Empresa.new(params.require(:empresa).permit(:nome,:cnpj,:email,:endereco,:cidade,:area_atuacao,:senha))
        @empresa.senha=Digest::MD5.hexdigest(@empresa.senha)
        @empresa.valido = false
        @empresa.senha_ativacao = SecureRandom.uuid
        if @empresa.save
            InscricaoEmpresaMailer.cadastro(@empresa).deliver
            redirect_to :empresas, notice: "Empresa #{@empresa.nome} salvo"
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
        if (!session[:empresa_id].nil? and session[:empresa_id] != params[:id].to_i) or (session[:empresa_id].nil? and session[:admin_id].nil?)
            redirect_to '/erro_sessao' and return
        end
        @empresa = Empresa.find(params[:id])
        @empresa.senha = Digest::MD5.hexdigest(params[:empresa][:senha])  
        if @empresa.update(params.require(:empresa).permit(:nome,:cnpj,:email,:endereco,:cidade,:area_atuacao))
            redirect_to :empresas, notice: "Empresa #{@empresa.nome} atualizado"
        else
            render :edit
        end
    end


    def destroy
        if !session[:usuario_inativo_id].nil? or !session[:empresa_inativa_id].nil?
            redirect_to '/ativar' and return
        end
        if !session[:admin_id].nil?
            e = Empresa.find(params[:id])
            e.destroy
            redirect_to :empresas, notice: "Empresa #{e.nome} excluido"
        else 
            redirect_to '/erro_sessao' and return
        end
    end

    def show
        if !session[:usuario_inativo_id].nil? or !session[:empresa_inativa_id].nil?
            redirect_to '/ativar' and return
        end
        if !session[:usuario_id].nil?
            flash[:alert] = 'Logado como: aluno ('+session[:usuario]+')'
            redirect_to '/logado' and return
        end
        if (!session[:empresa_id].nil? and session[:empresa_id] != params[:id].to_i) or (session[:empresa_id].nil? and session[:admin_id].nil?)
            redirect_to '/erro_sessao' and return
        end
        @empresa = Empresa.find(params[:id])
        if !session[:admin_id].nil?
            render layout: 'admin'
        else
            render layout: 'empresa'
        end

    end

end
