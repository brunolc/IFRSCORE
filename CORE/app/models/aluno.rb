class Aluno < ActiveRecord::Base
validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

validates :nome,presence: true

validates :matricula,presence: true

validates :email,presence: true

validates :senha,presence: true

validates :matricula,uniqueness: true

validates :email,uniqueness: true
end
