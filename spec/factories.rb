FactoryGirl.define do
  factory(:user) do
    name('Sam')
    sequence :email do |n|
      (n + rand(100000)).to_s + "@example.com"
    end
    password("cheese")
    admin(true)
  end

  factory(:comment) do
    body("I agree wit chu")
  end

  factory(:tag) do
    sequence :category do |n|
      (n + rand(100000) + rand(n)).to_s + "deezl tru"
    end
  end
end
