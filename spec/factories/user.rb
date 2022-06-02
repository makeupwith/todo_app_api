FactoryBot.define do
  factory :user do
    id { '1' }
    # display_name { Faker::Name.name  }
    display_name { "Toby Lowe" }
    email { "maryellen@gmail.com" }
    # email { Faker::Internet.free_email }
    password { '12345678' }
    password_confirmation { '12345678' }
  end
end