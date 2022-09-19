# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   name: 'admin',
   email: 'admin@admin',
   password: '111111'
)

user=User.create(name: "Erika",
                  introduction: "I like traveling.",
                  email: "erika@email.com",
                  password: "phoenix",
                  password_confirmation: "phoenix"
                  )
user.profile_image.attach(io: File.open(Rails.root.join('app/assets/images/author1.jpg')),
                  filename: 'author1.jpg')

user=User.create(name: "River",
                  introduction: "I like taking photos.",
                  email: "river@email.com",
                  password: "phoenix",
                  password_confirmation: "phoenix"
                  )
user.profile_image.attach(io: File.open(Rails.root.join('app/assets/images/profile_image.jpeg')),
                  filename: 'profile_image.jpeg')

