namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
  end
end

def make_users
  admin = User.create!(name: "Shakin8",
                       email: "beattie.rory@gmail.com",
                       password: "h4f12h",
                       password_confirmation: "h4f12h",
                       username: "shakin8",
                       permalink: "shakin8")
  admin.toggle!(:admin)
  admin = User.create!(name: "Sarleks",
                       email: "timeless_night@hotmail.com",
                       password: "h4f12h",
                       password_confirmation: "h4f12h",
                       username: "sarleks",
                       permalink: "sarleks")
  admin.toggle!(:admin)
  99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    username = "username#{n+1}"
    permalink = username
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password,
                 username: username,
                 permalink: permalink)
  end
end

def make_microposts
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end

def make_relationships
  users = User.all
  user = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end
