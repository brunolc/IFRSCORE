class Curriculo < ActiveRecord::Base
  belongs_to :aluno
  validates :nome,presence: true
end
