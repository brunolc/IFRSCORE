# encoding: UTF-8


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



Senha2 = Digest::MD5.hexdigest('admin')
Admin.create email:'imhyaku@gmail.com', username:'admin' ,senha:Senha2

Curso.create nome:'Informática para Internet'
Curso.create nome:'Geoprocessamento'
Curso.create nome:'Eletrotécnica'
Curso.create nome:'Automação Industrial'
Curso.create nome:'Fabricação Mecânica'
Curso.create nome:'Refrigeração e Climatização'