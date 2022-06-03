FactoryBot.define do
  factory :task do
    id { '1' }
    completed   { "true" }
    deadline    { '2022-06-03' }
    description { Faker::Games::Pokemon.name }
    name        { "大掃除" }
    public      { "true" }
    assignee_id { '1' }
    user_id     { '1' }
  end
end