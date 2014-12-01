class InscricaoEmpresaMailer < ActionMailer::Base
  default from: "ifrscoretestes@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.inscricao_empresa_mailer.realizada.subject
  #
  def realizada(i)
    @inscricao = i
    @vaga = Vaga.find_by_id(@inscricao.vaga)
    @empresa = Empresa.find_by_id(@vaga.empresa)
    mail to: @empresa.email, subject: "(IFRSCORE) Inscrição realizada"
  end

  def cadastro(e)
    @empresa = e
    admin = Admin.find(1)
    mail to: @admin.email, subject: "(IFRSCORE) Confirmação de cadastro de Empresa"
  end
end
