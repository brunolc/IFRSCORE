class CreateAlunos < ActiveRecord::Migration
  def change
    create_table :alunos do |t|
      t.string :matricula, limit: 8
      t.string :nome, limit: 50
      t.string :email
      t.string :senha, limit: 32
      t.references :curso, index: true
      t.boolean :ativo
      t.string :senha_ativacao, limit: 36

      t.timestamps
    end
  end
end
