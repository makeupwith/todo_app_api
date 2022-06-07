require 'rails_helper'

# RSpec
RSpec.describe Subtask, type: :model do
  # アソシエーションのテスト
  describe 'associations' do
    it { should belong_to(:task) }
  end

  # バリデーションのテスト
  describe 'validations' do
  end
end