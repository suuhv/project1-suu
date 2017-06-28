User.create! name: "Example User",
  email: "suu@123.com",
  password: "123123",
  password_confirmation: "123123"

Settings.user.faker_user_number.times do |n|
  name = Faker::Name.name
  email = "suu#{n+1}@123.com"
  password = "123123"
  User.create! name: name,
    email: email,
    password: password,
    password_confirmation: password
end

users = User.order(:created_at).take 6
50.times do
  title = Faker::Lorem.sentence 3
  content = Faker::Lorem.sentence 5
  users.each{|user| user.microposts.create! content: content, title: title}
end

users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each{|followed| user.follow followed}
followers.each{|follower| follower.follow user}
