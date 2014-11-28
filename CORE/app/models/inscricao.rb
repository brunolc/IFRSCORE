class Inscricao < ActiveRecord::Base
  belongs_to :vaga
  belongs_to :aluno
end
