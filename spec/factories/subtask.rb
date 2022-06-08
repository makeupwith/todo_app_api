FactoryBot.define do
  factory :subtask do
    id { '1' }
    task_id { '1' }
    description { "とことん突き詰める精神" }
    completed { false }
  end
end