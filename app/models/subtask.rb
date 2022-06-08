# == Schema Information
#
# Table name: subtasks
#
#  id          :integer          not null, primary key
#  completed   :boolean
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  task_id     :integer
#
# Indexes
#
#  index_subtasks_on_task_id  (task_id)
#
# Foreign Keys
#
#  task_id  (task_id => tasks.id)
#
class Subtask < ApplicationRecord
  # モデルの関連付け -> tasks
  belongs_to :task
  
  # 詳細
  validates :description, presence: true
  
  # 完了
  validates :completed, presence: true
  
  # タスクID
  validates :task_id, presence: true
end
