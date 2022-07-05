class CreateLeaves < ActiveRecord::Migration[6.1]
  def change
    create_table :leaves do |t|
      t.date :leave_from
      t.date :leave_to
      t.string :leave_mail_to
      t.text :leave_reason
      t.integer :manager_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
