# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#r1 = Rol.find(1)
#
# u1 = Usuario.create({ nombre: 'Sally', email: 'sally@example.com', password: 'hola123', password_confirmation: 'hola123', rol_id: r1.id })
# p "#{u1.email}"
#
#Obtenemos rol

p1 = Producto.find(4);
s1 = Size.create(talla: 43, stock: 3, producto_id: p1.id) ;