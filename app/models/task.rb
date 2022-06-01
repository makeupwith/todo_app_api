class Task < ApplicationRecord
  # モデルの関連付け -> users
  belongs_to :users
  
  # 名前
  validates :name, presence: true
  
  # 詳細
  validates :description
  
  # 期日
  validates :deadline
  
  # 完了
  validates :completed, presence: true
  
  # ユーザID
  validates :user_id, presence: true
  
  # 担当者
  validates :assignee_id
  
  # 公開権限
  validates :public, presence: true
end
