class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :nome, limit: 30
      t.string :cnpj, limit: 40
      t.string :endereco, limit: 50
      t.string :cidade, limit: 50
      t.text :descricao
      t.string :senha, limit: 32

      t.timestamps
    end
  end
end
