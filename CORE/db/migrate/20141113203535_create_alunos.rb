class CreateAlunos < ActiveRecord::Migration
  def change
    create_table :alunos do |t|
      t.string :matricula, limit: 9
      t.string :nome, limit: 30
      t.string :curriculo, limit: 36
      t.string :email, limit: 30
      t.string :senha, limit: 32
      t.references :curso, index: true

      t.timestamps
    end
  end
end
