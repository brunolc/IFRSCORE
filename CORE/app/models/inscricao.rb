class Inscricao < ActiveRecord::Base
  belongs_to :vaga
  belongs_to :aluno

validates :vaga,presence: true

validates :aluno,presence: true


end
