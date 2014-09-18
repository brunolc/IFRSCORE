class Aluno < ActiveRecord::Base
validates :nome,presence: true

validates :matricula,presence: true

validates :email,presence: true

validates :senha,presence: true

validates :matricula,uniqueness: true

validates :email,uniqueness: true
end
