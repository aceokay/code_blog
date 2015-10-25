FactoryGirl.define do
  factory(:user) do
    id(1)
    name('Sam')
    sequence :email do |n|
      (n + rand(100000)).to_s + "@example.com"
    end
    password("cheese")
    admin(true)
  end

  factory :non_admin_user, class: User do
    id(2)
    name('Duke')
    sequence :email do |n|
      (n + rand(100000)).to_s + "@example.com"
    end
    password("whose")
    admin(false)
  end

  factory(:post) do
    id(1)
    title("Love is real")
    body("Build a home at home with love.")
    user_id(1)
  end

  factory(:comment) do
    title("I agree, this is a comment")
    body("Such great comments here!")
    user_id(2)
    post_id(1)
  end

  factory(:tag) do
    sequence :category do |n|
      (n + rand(100000) + rand(n)).to_s + "deezl tru"
    end
  end
end
