require 'rails_helper'

# RSpec
RSpec.describe Task, type: :model do
  # アソシエーションのテスト
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:subtasks) }
  end

  # バリデーションのテスト
  describe 'validations' do
  end
end