class Vaga < ActiveRecord::Base
  belongs_to :empresa
  belongs_to :curso


validates :numero,presence: true

validates :empresa,presence: true

validates :curso,presence: true

validates :aberta,presence: true

validates :descricao,presence: true


end
