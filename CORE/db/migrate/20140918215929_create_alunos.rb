class CreateAlunos < ActiveRecord::Migration
  def change
    create_table :alunos do |t|
      t.string :matricula, limit: 15
      t.string :nome, limit: 30
      t.string :curriculo, limit: 36
      t.string :email, limit: 30
      t.string :senha, limit: 12

      t.timestamps
    end
  end
end
