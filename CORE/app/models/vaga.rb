class Vaga < ActiveRecord::Base
  belongs_to :empresa
  validates :numero,presence: true

validates :empresa,presence: true

validates :descricao,presence: true
end
