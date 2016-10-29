FactoryGirl.define do
  factory :user, aliases: [:owner] do
    email { Faker::Internet.email }

    # min-length, max-length, CapsAllowed, SymbolsAllowed
    password { Faker::Internet.password(10, 20, true, true) }
    password_confirmation { self.password }

  end
end
