class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.string :nome, limit: 30

      t.timestamps
    end
  end
end
