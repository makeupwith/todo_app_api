# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  completed   :boolean
#  deadline    :date
#  description :string
#  name        :string
#  public      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  assignee_id :integer
#  user_id     :integer
#
# Indexes
#
#  index_tasks_on_assignee_id  (assignee_id)
#  index_tasks_on_user_id      (user_id)
#
# Foreign Keys
#
#  assignee_id  (assignee_id => users.id)
#  user_id      (user_id => users.id)
#
class Task < ApplicationRecord
  # モデルの関連付け -> users
  belongs_to :user
  
  # 名前
  validates :name, presence: true
  
  # 詳細
  validate :description
  
  # 期日
  validate :deadline
  
  # 完了
  validates :completed, presence: true
  
  # ユーザID
  validates :user_id, presence: true
  
  # 担当者
  validate :assignee_id
  
  # 公開権限
  validates :public, presence: true
end
