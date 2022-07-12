class AddNumberOfHoursToStatus < ActiveRecord::Migration[6.1]
  def change
    add_column :statuses, :total_hours, :integer, default: 0
  end
end
