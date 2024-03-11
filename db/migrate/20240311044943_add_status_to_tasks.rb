class AddStatusToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :status, :text
  end
end
