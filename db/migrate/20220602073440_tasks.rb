class Tasks < ActiveRecord::Migration[6.1]
  drop_table :tasks
  
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.date :deadline
      t.boolean :completed
      t.references :user, foreign_key: { to_table: :users}
      t.references :assignee, foreign_key: { to_table: :users}
      t.boolean :public

      t.timestamps
    end
  end
end
