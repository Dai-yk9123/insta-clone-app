User.create!(name:  "Example User",
             user_name: "Foobar",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             url:   "https://localhost:3000",
             description: "Hi, I am Example User. Let's play!",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  user_name = "#{Faker::Name.name}-#{n+1}"
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  url = Faker::Internet.url
  description = Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 4)
  User.create!(name:  name,
               user_name: user_name,
               email: email,
               password:              password,
               password_confirmation: password,
               url:  url,
               description: description)
end
