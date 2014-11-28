class CreateInscricoes < ActiveRecord::Migration
  def change
    create_table :inscricoes do |t|
      t.references :vaga, index: true
      t.references :aluno, index: true
      t.boolean :aberta

      t.timestamps
    end
  end
end
