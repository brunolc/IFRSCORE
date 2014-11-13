class CreateVagas < ActiveRecord::Migration
  def change
    create_table :vagas do |t|
      t.integer :numero
      t.text :descricao
      t.references :empresa, index: true
      t.references :curso, index: true

      t.timestamps
    end
  end
end
