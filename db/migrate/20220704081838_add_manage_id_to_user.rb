class AddManageIdToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :manager_id, :integer
  end
end
