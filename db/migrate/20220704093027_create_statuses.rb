class CreateStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :statuses do |t|
      t.string :project_name
      t.time :working_hours
      t.text :task
      t.references :user, null: false, foreign_key: true
      t.integer :manager_id

      t.timestamps
    end
    add_index :statuses, %i[user_id created_at]
  end
end
