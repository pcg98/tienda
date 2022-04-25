# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#
#Obtenemos rol
r1 = Rol.find(1)
r2 = Rol.find(2)
r3 = Rol.find(3)

u1 = Usuario.create({ nombre: 'Sally', email: 'sally@example.com', password: 'hola123', password_confirmation: 'hola123', rol_id: r1.id })
u2 = Usuario.create({ nombre: 'Sue', email: 'sue@example.com', password: 'hola123', password_confirmation: 'hola123', rol_id: r2.id })
u3 = Usuario.create({ nombre: 'Kev', email: 'kev@example.com', password: 'hola123', password_confirmation: 'hola123', rol_id: r2.id })
u4 = Usuario.create({ nombre: 'Jack', email: 'jack@example.com', password: 'hola123', password_confirmation: 'hola123', rol_id: r3.id })
p "#{u1.email}"
p "Creados #{Usuario.count} usuarios"
