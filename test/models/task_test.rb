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
require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
