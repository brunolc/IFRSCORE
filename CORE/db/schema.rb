# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141129145825) do

  create_table "admins", force: true do |t|
    t.string   "email",      limit: 30
    t.string   "username",   limit: 30
    t.string   "senha",      limit: 32
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alunos", force: true do |t|
    t.string   "matricula",      limit: 8
    t.string   "nome",           limit: 50
    t.string   "email"
    t.string   "senha",          limit: 32
    t.integer  "curso_id"
    t.boolean  "ativo"
    t.string   "senha_ativacao", limit: 36
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "alunos", ["curso_id"], name: "index_alunos_on_curso_id"

  create_table "curriculos", force: true do |t|
    t.string   "nome"
    t.date     "nascimento"
    t.string   "estado_civil"
    t.string   "endereco"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "cep"
    t.string   "uf"
    t.string   "telefone"
    t.string   "celular"
    t.string   "rg",                         limit: 10
    t.string   "cpf",                        limit: 11
    t.string   "cnh"
    t.string   "formacao_tecnica_curso"
    t.string   "formacao_tecnica_periodo"
    t.string   "formacao_tecnica_entidade"
    t.string   "formacao_tecnica_cidade"
    t.string   "formacao_tecnica_uf"
    t.string   "formacao_superior_curso"
    t.string   "formacao_superior_periodo"
    t.string   "formacao_superior_entidade"
    t.string   "formacao_superior_cidade"
    t.string   "formacao_superior_uf"
    t.string   "formacao_outra_curso"
    t.string   "formacao_outra_periodo"
    t.string   "formacao_outra_entidade"
    t.string   "formacao_outra_cidade"
    t.string   "formacao_outra_uf"
    t.string   "experiencia_empresa_1"
    t.string   "experiencia_funcao_1"
    t.date     "experiencia_inicio_1"
    t.date     "experiencia_fim_1"
    t.string   "experiencia_empresa_2"
    t.string   "experiencia_funcao_2"
    t.date     "experiencia_inicio_2"
    t.date     "experiencia_fim_2"
    t.string   "experiencia_empresa_3"
    t.string   "experiencia_funcao_3"
    t.date     "experiencia_inicio_3"
    t.date     "experiencia_fim_3"
    t.string   "experiencia_empresa_4"
    t.string   "experiencia_funcao_4"
    t.date     "experiencia_inicio_4"
    t.date     "experiencia_fim_4"
    t.string   "experiencia_empresa_5"
    t.string   "experiencia_funcao_5"
    t.date     "experiencia_inicio_5"
    t.date     "experiencia_fim_5"
    t.text     "cursos"
    t.integer  "aluno_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "curriculos", ["aluno_id"], name: "index_curriculos_on_aluno_id"

  create_table "cursos", force: true do |t|
    t.string   "nome",       limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "empresas", force: true do |t|
    t.string   "nome",           limit: 50
    t.string   "cnpj",           limit: 40
    t.string   "endereco",       limit: 50
    t.string   "cidade",         limit: 50
    t.string   "senha",          limit: 32
    t.text     "area_atuacao"
    t.boolean  "valido"
    t.string   "senha_ativacao", limit: 36
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inscricoes", force: true do |t|
    t.integer  "aluno_id"
    t.integer  "vaga_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "inscricoes", ["aluno_id"], name: "index_inscricoes_on_aluno_id"
  add_index "inscricoes", ["vaga_id"], name: "index_inscricoes_on_vaga_id"

  create_table "vagas", force: true do |t|
    t.integer  "numero"
    t.text     "descricao"
    t.boolean  "aberta"
    t.integer  "empresa_id"
    t.integer  "curso_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vagas", ["curso_id"], name: "index_vagas_on_curso_id"
  add_index "vagas", ["empresa_id"], name: "index_vagas_on_empresa_id"

end
