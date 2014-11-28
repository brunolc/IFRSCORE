class InscricaoAlunoMailer < ActionMailer::Base
  default from: "ifrscoretestes@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.inscricao_aluno_mailer.realizada.subject
  #
  def realizada(i)
    @inscricao = i
    @aluno = Aluno.find_by_id(@inscricao.aluno)
    mail to: @aluno.email, subject: "(IFRSCORE) Inscricao realizada"
  end
end
