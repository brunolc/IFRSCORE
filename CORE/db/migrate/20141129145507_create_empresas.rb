class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :nome, limit: 50
      t.string :cnpj, limit: 40
      t.string :endereco, limit: 50
      t.string :cidade, limit: 50
      t.string :senha, limit: 32
      t.text :area_atuacao
      t.boolean :valido
      t.string :senha_ativacao, limit: 36
      t.string :email

      t.timestamps
    end
  end
end
