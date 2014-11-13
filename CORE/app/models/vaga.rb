class Vaga < ActiveRecord::Base
  belongs_to :empresa
  belongs_to :curso
end
