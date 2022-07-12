class RemoveWorkingHoursFromStatus < ActiveRecord::Migration[6.1]
  def change
    remove_column :statuses, :working_hours, :time
  end
end
