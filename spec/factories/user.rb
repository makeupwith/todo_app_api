FactoryBot.define do
  factory :user do
    id { '1' }
    display_name { "Toby Lowe" }
    email { "maryellen@gmail.com" }
    password { 'hogehogehoge12345678' }
  end
end

# FactoryBot.define do
#   factory :new_user, class: User do
#     display_name { "Toby Lowe" }
#     email { Faker::Internet.email }
#     password { 'hogehogehoge12345678' }
#   end
# end