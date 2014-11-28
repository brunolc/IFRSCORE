class InscricaoEmpresaMailer < ActionMailer::Base
  default from: "ifrscoretestes@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.inscricao_empresa_mailer.realizada.subject
  #
  def realizada(i)
    @inscricao = i
    puts ">>>>>"
    puts @inscricao.vaga
    @vaga = Vaga.find_by_id(@inscricao.vaga)
    p @vaga
    @empresa = Empresa.find_by_id(@vaga.empresa)
    p @empresa
    mail to: @empresa.email, subject: "(IFRSCORE) Inscricao realizada"


  end
end
