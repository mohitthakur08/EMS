# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.boolean :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :projects, %i[user_id created_at]
  end
end
