class User < ApplicationRecord
  # モデルの関連付け <- tasks
  has_many :tasks, class_name: "Tasks", dependent: :destroy

  # メールアドレスを小文字に変換
  before_save { self.email = email.downcase }
  
  # メールアドレス
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, 
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
    
  # パスワード(ハッシュ化)
  has_secure_password # ハッシュ化を行うメソッド
  validates :password, presence: true, length: { minimum: 8 }
  
   # 表示名
  validates :display_name, length: { maximum: 50 }
end