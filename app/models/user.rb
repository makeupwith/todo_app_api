# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  display_name    :string
#  email           :string
#  password_digest :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  # モデルの関連付け <- tasks
  # has_many :tasks, class_name: "Tasks", dependent: :destroy
  has_many :tasks

  # メールアドレスを小文字に変換
  before_save { self.email = email.downcase }
  
  # メールアドレス
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true, length: { maximum: 255 }, 
  #   format: { with: VALID_EMAIL_REGEX },
  #   uniqueness: { case_sensitive: false }
  validates :email, presence: true
    
  # パスワード(ハッシュ化)
  has_secure_password # ハッシュ化を行うメソッド
  validates :password, presence: true, length: { minimum: 8 }, on: :create
  
   # 表示名
  validates :display_name, length: { maximum: 50 }
end
