class AddStatusToLeaves < ActiveRecord::Migration[6.1]
  def change
    add_column :leaves, :status, :integer, default: 0
  end
end
