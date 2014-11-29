class CreateCurriculos < ActiveRecord::Migration
  def change
    create_table :curriculos do |t|
      t.string :nome
      t.date :nascimento
      t.string :estado_civil
      t.string :endereco
      t.string :bairro
      t.string :cidade
      t.string :cep
      t.string :uf
      t.string :telefone
      t.string :celular
      t.string :rg, limit: 10
      t.string :cpf, limit: 11
      t.string :cnh
      t.string :formacao_tecnica_curso
      t.string :formacao_tecnica_periodo
      t.string :formacao_tecnica_entidade
      t.string :formacao_tecnica_cidade
      t.string :formacao_tecnica_uf
      t.string :formacao_superior_curso
      t.string :formacao_superior_periodo
      t.string :formacao_superior_entidade
      t.string :formacao_superior_cidade
      t.string :formacao_superior_uf
      t.string :formacao_outra_curso
      t.string :formacao_outra_periodo
      t.string :formacao_outra_entidade
      t.string :formacao_outra_cidade
      t.string :formacao_outra_uf
      t.string :experiencia_empresa_1
      t.string :experiencia_funcao_1
      t.date :experiencia_inicio_1
      t.date :experiencia_fim_1
      t.string :experiencia_empresa_2
      t.string :experiencia_funcao_2
      t.date :experiencia_inicio_2
      t.date :experiencia_fim_2
      t.string :experiencia_empresa_3
      t.string :experiencia_funcao_3
      t.date :experiencia_inicio_3
      t.date :experiencia_fim_3
      t.string :experiencia_empresa_4
      t.string :experiencia_funcao_4
      t.date :experiencia_inicio_4
      t.date :experiencia_fim_4
      t.string :experiencia_empresa_5
      t.string :experiencia_funcao_5
      t.date :experiencia_inicio_5
      t.date :experiencia_fim_5
      t.text :cursos
      t.references :aluno, index: true

      t.timestamps
    end
  end
end
