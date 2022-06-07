class CreateSubtasks < ActiveRecord::Migration[6.1]
  def change
    create_table :subtasks do |t|
      t.integer :task_id, foreign_key: { to_table: :tasks }
      t.string :description
      t.boolean :completed

      t.timestamps
    end
  end
end
