require 'digest'
class AlunosController < ApplicationController
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
            @alunos = Aluno.all
            render layout: 'admin'
        end
            redirect_to 'erro_sessao' and return
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
        if session[:usuario_id].nil?
            @aluno = Aluno.new
            @cursos =Curso.all
            if !session[:admin_id].nil?
                render layout: 'admin'
            end
        end
    end

    def edit
        if !session[:usuario_inativo_id].nil? or !session[:empresa_inativa_id].nil?
            redirect_to '/ativar' and return
        end
        if !session[:empresa_id].nil?
            flash[:alert] = 'Logado como: empresa ('+session[:empresa]+')'
            redirect_to '/logado' and return
        end
        if (!session[:usuario_id].nil? and session[:usuario_id] != params[:id].to_i) or (session[:usuario_id].nil? and session[:admin_id].nil?)
            redirect_to '/erro_sessao' and return
        else
            @aluno = Aluno.find(params[:id].to_i)
            @cursos =Curso.all
            if !session[:admin_id].nil?
                render layout: 'admin'
            else
                render layout: 'aluno'
            end
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
            redirect_to :alunos, notice: "Aluno #{@aluno.nome} salvo" and return
        else
            render :new
        end
    end

    def update
        if !session[:usuario_inativo_id].nil? or !session[:empresa_inativa_id].nil?
            redirect_to '/ativar' and return
        end
        if !session[:empresa_id].nil?
            flash[:alert] = 'Logado como: empresa ('+session[:empresa]+')'
            redirect_to '/logado' and return
        end
        if (!session[:usuario_id].nil? and session[:usuario_id] != params[:id].to_i) or (session[:usuario_id].nil? and session[:admin_id].nil?)
            redirect_to '/erro_sessao' and return
        end
        @aluno = Aluno.find(params[:id].to_i)
        @aluno.senha = Digest::MD5.hexdigest(params[:aluno][:senha])  
        @aluno.curso=Curso.find_by_nome(params[:curso])
        if @aluno.update(params.require(:aluno).permit(:matricula,:nome,:email))
            redirect_to :alunos, notice: "Aluno #{@aluno.nome} atualizado" and return
        else
            render :edit
        end
    end


    def destroy
        if !session[:usuario_inativo_id].nil? or !session[:empresa_inativa_id].nil?
            redirect_to '/ativar' and return
        end
        if !session[:admin_id].nil?
            a = Aluno.find(params[:id].to_i)
            a.destroy
            redirect_to :alunos, notice: "Aluno #{a.nome} excluido" and return
        else 
            redirect_to 'erro_sessao' and return
        end
    end

    def show
        if !session[:usuario_inativo_id].nil? or !session[:empresa_inativa_id].nil?
            redirect_to '/ativar' and return
        end
        if !session[:empresa_id].nil?
            flash[:alert] = 'Logado como: empresa ('+session[:empresa]+')'
            redirect_to '/logado' and return
        end
        if (!session[:usuario_id].nil? and session[:usuario_id] != params[:id].to_i) or (session[:usuario_id].nil? and session[:admin_id].nil?)
=begin      puts "check 1" if (!session[:usuario_id].nil? and session[:usuario_id] != params[:id].to_i)
            puts "check 2" if (session[:usuario_id].nil? and session[:admin_id].nil?)
            puts session[:usuario_id].class
            integ = session[:usuario_id]
            puts integ.to_s.nil? +'...'
            puts params[:id].to_i.class
=end
            redirect_to '/erro_sessao' and return
        end
        @aluno = Aluno.find(params[:id].to_i)
        @cursos=Curso.find(@aluno.curso)
        if !session[:admin_id].nil?
            render layout: 'admin'
        else
            render layout: 'aluno'
        end
    end  
end