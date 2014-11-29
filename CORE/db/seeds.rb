# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Senha1 = Digest::MD5.hexdigest('admin')
Aluno.create nome:'aluno', matricula:'11030116' ,email:'francisco@gmail.com' ,senha:Senha1


Senha = Digest::MD5.hexdigest('admin')
Empresa.create nome:'google', cnpj:'11030116' ,endereco:'rua 13 bairro 2324' ,cidade:'rio grande',email:'google@gmail.com',area_atuacao:'manja das buscas',senha:Senha