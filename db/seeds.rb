# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(
   name: 'admin',
   email: 'admin@admin',
   password: '111111'
)

User.create(
  [ {name: "Erika",
    introduction: "I like traveling.",
    email: "erika@email.com",
    password: "phoenix",
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/unicorn.png")),filename: 'unicorn.png')
    } ],
  [ {name: "River",
    introduction: "I like taking photos.",
    email: "river@email.com",
    password: "phoenix",
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/profile_image.jpg")),filename: 'profile_image.jpg')
    } ],
  [ {name: "Angelina",
    introduction: "Show you guys my favorite spots.",
    email: "angelina@email.com",
    password: "phoenix",
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/feet.jpg")),filename: 'feet.jpg')
    } ],
  [ {name: "Zoe",
    introduction: "The sky's the limit.",
    email: "zoe@email.com",
    password: "phoenix",
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/boy.jpg")),filename: 'boy.jpg')
    } ],
  [ {name: "Lea",
    introduction: "Blue is therefore most suitable as the color of interior life.",
    email: "lea@email.com",
    password: "phoenix",
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/sunglasses.jpg")),filename: 'sunglasses.jpg')
    } ],
  [ {name: "Adele",
    introduction: "Bloom where you are planted.",
    email: "adele@email.com",
    password: "phoenix",
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/dog.jpg")),filename: 'dog.jpg')
    } ]
  )

Genre.create(
  [ {name: 'TOURIST ATTRACTION'} ],
  [ {name: 'THINGS TO DO'} ],
  [ {name: 'FOOD & DRINK'} ],
  [ {name: 'SHOPPING'} ],
  [ {name: 'SERVICES'} ]
  )

Spot.create!(
  [ {genre_id: 1,
    user_id: 1,
    name: "名古屋城 Nagoya Castle",
    address: "1-1 Honmaru, Naka Ward, Nagoya, Aichi",
    caption: "You must visit!",
    star: "5",
    latitude: 35.1848,
    longitude: 136.8997,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Nagoya_castle.jpg")),filename: 'Nagoya_castle.jpg')
    } ],
  [ {genre_id: 1,
    user_id: 1,
    name: "名古屋城 金の鯱鉾 Nagoya Castle golden dolphins",
    address: "1-1 Honmaru, Naka Ward, Nagoya, Aichi",
    caption: "You can find it on the way to the castle.",
    star: "3",
    latitude: 35.1848,
    longitude: 136.8997,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Shachihoko.jpg")),filename: 'Shachihoko.jpg')
    } ],
  [ {genre_id: 1,
    user_id: 2,
    name: "阿蘇神宮 Aso Shrine",
    address: "3083-1 Ichinomiyamachi Miyaji, Aso, Kumamoto",
    caption: "Aso is one of the oldest shrines in Japan. This shrine holds several Important Cultural Properties, including Ichi-no-shinden, Ni-no-shinden, and Rōmon",
    star: "4",
    latitude: 32.9480,
    longitude: 131.1162,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Aso_shrine.jpg")),filename: 'Aso_shrine.jpg')
    } ],
  [ {genre_id: 1,
    user_id: 3,
    name: "CN Tower",
    address: "290 Bremner Blvd, Toronto, ON M5V 3L9, Canada",
    caption: "Its name CN referred to Canadian National, the railway company that built the tower.",
    star: "4",
    latitude: 43.6426,
    longitude: 79.3871,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/CN_tower.jpg")),filename: 'CN_tower.jpg')
    } ],
  [ {genre_id: 2,
    user_id: 3,
    name: "Toronto Island",
    address: "Lake Ontario",
    caption: "The Toronto Islands are a chain of 15 small islands in Lake Ontario. You can see this beautiful Toronto's city view from this island.",
    star: "5",
    latitude: 43.6214,
    longitude: 79.3788,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Toronto.jpg")),filename: 'Toronto.jpg')
    } ],
  [ {genre_id: 2,
    user_id: 3,
    name: "Woodbine Beach",
    address: "1675 Lake Shore Blvd E, Toronto, ON M4L 3W6, Canada",
    caption: "Woodbine Beach is the largest of the four beaches in the Beaches in Toronto. People just come and chill on this beach day and night.",
    star: "3",
    latitude: 43.6622,
    longitude: 79.3088,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Woodbine.jpg")),filename: 'Woodbine.jpg')
    } ],
  [ {genre_id: 3,
    user_id: 4,
    name: "The Keg Steakhouse",
    address: "560 King St W, Toronto, ON M5V 1M3, Canada",
    caption: "Solid steaks and great variety, you can never really go wrong here.",
    star: "5",
    latitude: 43.6445,
    longitude: 79.3993,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/The_Keg_Steakhouse.jpg")),filename: 'The_Keg_Steakhouse.jpg')
    } ],
  [ {genre_id: 3,
    user_id: 4,
    name: "Schwartz's Deli",
    address: "3895 St Laurent Blvd, Montreal, Quebec H2W 1X9, Canada",
    caption: "When in Montréal, Schwartz is still a must-go destination for smoked meat sandwiches.",
    star: "4",
    latitude: 45.5142,
    longitude: 73.5785,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Schwartzs_deli.jpg")),filename: 'Schwartzs_deli.jpg')
    } ],
  [ {genre_id: 1,
    user_id: 5,
    name: "Rockfeller Center Christmas tree",
    address: "45 Rockefeller Plaza, New York, NY 10111, United States",
    caption: "It’s absolutely chaotic and the crowds are crazy around Christmas time.",
    star: "4",
    latitude: 40.7587,
    longitude: 73.9787,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Rockfeller_center.jpg")),filename: 'Rockfeller_center.jpg')
    } ],
  [ {genre_id: 5,
    user_id: 6,
    name: "名古屋JRゲートタワーホテル Nagoya JR Gate Tower Hotel",
    address: "1 Chome-1-3 Meieki, Nakamura Ward, Nagoya, Aichi",
    caption: "It is located at a spot where convenient to all kinds of railway transportations, to a lot of different types of restaurants and to many many shopping places. ",
    star: "4",
    latitude: 35.1709,
    longitude: 136.8815,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Nagoya_hotel.jpg")),filename: 'Nagoya_hotel.jpg')
    } ]
    )
