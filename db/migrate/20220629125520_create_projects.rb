class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.boolean :status
      t.integer :user_id,foreign_key: true
      t.integer :manager_id,foreign_key: true
      t.integer :admin_id,foreign_key: true

      t.timestamps
    end
  end
end
