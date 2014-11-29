class Empresa < ActiveRecord::Base
	validates :nome,presence: true

validates :cnpj,presence: true

validates :cidade,presence: true

validates :endereco,presence: true

validates :email,presence: true

validates :area_atuacao,presence: true

validates :email,uniqueness: true

validates :cnpj,uniqueness: true

validates :nome,uniqueness: true

end
