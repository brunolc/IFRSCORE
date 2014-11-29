class CreateInscricoes < ActiveRecord::Migration
  def change
    create_table :inscricoes do |t|
      t.references :aluno, index: true
      t.references :vaga, index: true

      t.timestamps
    end
  end
end
