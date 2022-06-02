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
require 'rails_helper'

# RSpec
RSpec.describe User, type: :model do
    
  # Taskモデルと一対多で関連付けされている
  describe 'associations' do
    it { is_expected.to have_many(:tasks) }
  end
  
  # -- バリデーションチェック -- 
  
  # 1. パスワードが大文字と英数字を含む8文字以上かどうか
  
  # 2. 表示名は20文字以下
  
  # 3. パスワードが暗号化されているか
end
