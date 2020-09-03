# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

accounts = %w[jsmith jdoe js1 js2 js3 js4]

accounts.each do |name|
  User.create(name: name,
              email: "#{name}@ex.com",
              password: 'foobar',
              password_confirmation: 'foobar')
end
