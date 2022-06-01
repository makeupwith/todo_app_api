class Subtask < ApplicationRecord
  # モデルの関連付け -> tasks
  belongs_to :tasks
  
  # 詳細
  validates :description, presence: true
  
  # 完了
  validates :completed, presence: true
  
  # タスクID
  validates :task_id, presence: true
end
