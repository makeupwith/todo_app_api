class NewSubtasks < ActiveRecord::Migration[6.1]
  # drop_table :subtasks
  
  def change
    create_table :subtasks do |t|
      t.references :task, foreign_key: { to_table: :tasks }
      t.string :description
      t.boolean :completed

      t.timestamps
    end
  end
end
