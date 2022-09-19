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

user1=User.create(name: "Erika",
                  introduction: "I like traveling.",
                  email: "erika@email.com",
                  password: "phoenix",
                  )
user1.profile_image.attach(io: File.open(Rails.root.join('app/assets/images/profile_image.jpg')),
                  filename: 'profile_image.jpg')

user2=User.create(name: "River",
                  introduction: "I like taking photos.",
                  email: "river@email.com",
                  password: "phoenix",
                  )
user2.profile_image.attach(io: File.open(Rails.root.join('app/assets/images/profile_image.jpg')),
                  filename: 'profile_image.jpg')

genre1=Genre.create!(
  name: 'TOURIST ATTRACTION'
)

spot1=Spot.user1.create!(genre_id: genre1.id,
                    name: "test_name",
                    address: "test_address",
                    caption: "test_caption",
                    star: "3",
                    latitude: 1,
                    longitude: 1
                    )
spot1.image.attach(io: File.open(Rails.root.join('app/assets/images/Nagoya_castle.jpg')), filename: 'Nagoya_castle.jpg')