# frozen_string_literal: true

class AddManageIdToProject < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :manager_id, :integer
  end
end
