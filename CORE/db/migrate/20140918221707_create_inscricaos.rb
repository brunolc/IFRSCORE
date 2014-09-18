class CreateInscricaos < ActiveRecord::Migration
  def change
    create_table :inscricaos do |t|
      t.references :vaga, index: true
      t.references :aluno, index: true

      t.timestamps
    end
  end
end
