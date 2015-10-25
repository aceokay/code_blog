FactoryGirl.define do
  factory(:user) do
    name('Sam')
    sequence :email do |n|
      (n + rand(100000)).to_s + "@example.com"
    end
    password("cheese")
    admin(true)
  end

  factory :non_admin_user, class: User do
    name('Duke')
    sequence :email do |n|
      (n + rand(100000)).to_s + "@example.com"
    end
    password("whose")
    admin(false)
  end

  factory(:post) do
    title("Love is real")
    body("Build a home at home with love.")
  end

  factory(:tag) do
    sequence :category do |n|
      (n + rand(100000) + rand(n)).to_s + "deezl tru"
    end
  end

  factory(:comment) do
    body("I agree wit chu")
  end
end
