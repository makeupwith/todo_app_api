# == Schema Information
#
# Table name: subtasks
#
#  id          :integer          not null, primary key
#  completed   :boolean
#  description :string
#  task        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
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
