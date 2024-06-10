
Trip.destroy_all

User.destroy_all

user_1 = User.create!(first_name: "Ricardo", last_name: "Tagliaverga", email: "ricardo@lewagon.com", password: "123123", city: "São Paulo", contractor: true)
user_2 = User.create!(first_name: "Mateus", last_name: "Silva", email: "mateus@lewagon.com", password: "123123", city: "São Paulo", contractor: true)
user_3 = User.create!(first_name: "Tais", last_name: "Erenita", email: "tais@lewagon.com", password: "123123", city: "São Paulo", contractor: true)
user_4 = User.create!(first_name: "Nicolas", last_name: "Ketchum", email: "nicolas@lewagon.com", password: "123123", city: "Japão", contractor: true)
user_5 = User.create!(first_name: "Eduardo", last_name: "Piccin", email: "eduardo@lewagon.com", password: "123123", city: "Paris", contractor: true)
user_6 = User.create!(first_name: "Roberto", last_name: "dos Santos", email: "roberto@lewagon.com", password: "123123", city: "India", contractor: true)
user_7 = User.create!(first_name: "Patricia", last_name: "Poeta", email: "patricia@lewagon.com", password: "123123", city: "Japão", contractor: true)
user_8 = User.create!(first_name: "Laura", last_name: "Ralph", email: "laura@lewagon.com", password: "123123", city: "Roma", contractor: true)
user_9 = User.create!(first_name: "Julia", last_name: "Julia", email: "julia@lewagon.com", password: "123123", city: "New York", contractor: true)
user_10 = User.create!(first_name: "Wesley", last_name: "Safadão", email: "wesley@lewagon.com", password: "123123", city: "São Paulo", contractor: true)


trip_1 = Trip.create!(destination: "Paris", star_date: DateTime.new(2024,05,10,8), end_date: DateTime.new(2024,06,1,22), user: user_1 )
trip_2 = Trip.create!(destination: "Roma", star_date: DateTime.new(2024,05,12,8), end_date: DateTime.new(2024,06,1,22), user: user_2 )
trip_3 = Trip.create!(destination: "Japão", star_date: DateTime.new(2024,05,20,8), end_date: DateTime.new(2024,06,1,22), user: user_3 )
trip_4 = Trip.create!(destination: "São Paulo", star_date: DateTime.new(2024,05,22,8), end_date: DateTime.new(2024,06,1,22), user: user_4 )
trip_5 = Trip.create!(destination: "New York", star_date: DateTime.new(2024,05,11,8), end_date: DateTime.new(2024,06,1,22), user: user_5 )
trip_6 = Trip.create!(destination: "Roma", star_date: DateTime.new(2024,05,9,8), end_date: DateTime.new(2024,06,1,22), user: user_6 )
trip_7 = Trip.create!(destination: "Paris", star_date: DateTime.new(2024,05,7,8), end_date: DateTime.new(2024,06,1,22), user: user_7 )
trip_8 = Trip.create!(destination: "Milão", star_date: DateTime.new(2024,05,13,8), end_date: DateTime.new(2024,06,1,22), user: user_8 )
trip_9 = Trip.create!(destination: "Paris", star_date: DateTime.new(2024,05,14,8), end_date: DateTime.new(2024,06,1,22), user: user_9 )
trip_10 = Trip.create!(destination: "Barcelona", star_date: DateTime.new(2024,05,15,8), end_date: DateTime.new(2024,06,1,22), user: user_10 )
trip_11= Trip.create!(destination: "Roma", star_date: DateTime.new(2024,05,5,8), end_date: DateTime.new(2024,06,1,22), user: user_2 )
trip_12 = Trip.create!(destination: "Rio de Janeiro", star_date: DateTime.new(2024,05,12,8), end_date: DateTime.new(2024,06,1,22), user: user_4 )
trip_13 = Trip.create!(destination: "Roma", star_date: DateTime.new(2024,05,15,8), end_date: DateTime.new(2024,06,1,22), user: user_5 )
trip_14 = Trip.create!(destination: "Paris", star_date: DateTime.new(2024,05,10,8), end_date: DateTime.new(2024,06,1,22), user: user_3 )
trip_15 = Trip.create!(destination: "Madrid", star_date: DateTime.new(2024,05,11,8), end_date: DateTime.new(2024,06,1,22), user: user_9 )
trip_16 = Trip.create!(destination: "Londres", star_date: DateTime.new(2024,05,14,8), end_date: DateTime.new(2024,06,1,22), user: user_10 )
trip_17 = Trip.create!(destination: "Roma", star_date: DateTime.new(2024,05,20,8), end_date: DateTime.new(2024,06,1,22), user: user_2 )
trip_18 = Trip.create!(destination: "Porto", star_date: DateTime.new(2024,05,21,8), end_date: DateTime.new(2024,06,1,22), user: user_1 )
trip_19 = Trip.create!(destination: "Paris", star_date: DateTime.new(2024,05,22,8), end_date: DateTime.new(2024,06,1,22), user: user_7 )
trip_20 = Trip.create!(destination: "Roma", star_date: DateTime.new(2024,05,9,8), end_date: DateTime.new(2024,06,1,22), user: user_6 )
