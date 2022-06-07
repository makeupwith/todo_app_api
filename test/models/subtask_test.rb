# == Schema Information
#
# Table name: subtasks
#
#  id          :integer          not null, primary key
#  completed   :boolean
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  task_id     :integer
#
# Indexes
#
#  index_subtasks_on_task_id  (task_id)
#
# Foreign Keys
#
#  task_id  (task_id => tasks.id)
#
require "test_helper"

class SubtaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
