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

ActiveRecord::Schema.define(version: 20141017081914) do

  create_table "alunos", force: true do |t|
    t.string   "matricula",  limit: 15
    t.string   "nome",       limit: 30
    t.string   "curriculo",  limit: 36
    t.string   "email",      limit: 30
    t.string   "senha",      limit: 12
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "empresas", force: true do |t|
    t.string   "nome",       limit: 30
    t.string   "cnpj",       limit: 40
    t.string   "endereco",   limit: 50
    t.string   "cidade",     limit: 50
    t.text     "descricao"
    t.string   "senha",      limit: 32
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inscricaos", force: true do |t|
    t.integer  "vaga_id"
    t.integer  "aluno_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "inscricaos", ["aluno_id"], name: "index_inscricaos_on_aluno_id"
  add_index "inscricaos", ["vaga_id"], name: "index_inscricaos_on_vaga_id"

  create_table "vagas", force: true do |t|
    t.integer  "numero"
    t.text     "descricao"
    t.integer  "empresa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vagas", ["empresa_id"], name: "index_vagas_on_empresa_id"

end
