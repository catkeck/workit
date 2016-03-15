User.create!(name: "Caitlin Keck", 
             email: "caitlin.keck@gmail.com", 
             password: "blooble", 
             password_confirmation: "blooble", 
             current_weight: 140,
             admin: true, 
             activated: true, 
             activated_at: Time.zone.now)

User.create!(name: "Rei Suzuki", 
             email: "raysuzuki@gmail.com", 
             password: "flooble", 
             password_confirmation: "flooble",
             current_weight: 150, 
             activated: true, 
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               current_weight: 100+Random.rand(100),
               activated: true,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

