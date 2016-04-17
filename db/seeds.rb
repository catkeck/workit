User.create!(name: "Caitlin Keck", 
             email: "caitlin.keck@gmail.com", 
             password: "blooble", 
             password_confirmation: "blooble", 
             admin: true, 
             activated: true, 
             activated_at: Time.zone.now)

User.create!(name: "Rei Suzuki", 
             email: "raysuzuki@gmail.com", 
             password: "flooble", 
             password_confirmation: "flooble",
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
               activated: true,
               activated_at: Time.zone.now)
end

#randomly creates posts by users on their own walls
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content, friend_id: user.id) }
end

Weight.create(weight: 100+Random.rand(100), user_id: 1, date: (Time.now - 3*86400).to_i)
Weight.create(weight: 100+Random.rand(100), user_id: 1, date: (Time.now - 2*86400).to_i)
Weight.create(weight: 100+Random.rand(100), user_id: 1, date: (Time.now - 86400).to_i)



