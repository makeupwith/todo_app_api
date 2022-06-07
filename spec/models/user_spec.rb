require 'rails_helper'

# RSpec
RSpec.describe User, type: :model do
  # アソシエーションのテスト
  describe 'associations' do
    it { should have_many(:tasks) }
  end

  # バリデーションのテスト
  describe 'validations' do
  end
end