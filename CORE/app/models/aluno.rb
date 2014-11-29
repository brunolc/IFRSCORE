class Aluno < ActiveRecord::Base
  belongs_to :curso
  validates :nome,presence: true

validates :matricula,presence: true

validates :email,presence: true

validates :senha,presence: true

validates :matricula,uniqueness: true

validates :email,uniqueness: true
end
