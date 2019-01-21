class DropTestStatuses < ActiveRecord::Migration[5.2]
  def change
    drop_table :test_statuses, if_exists: true
  end
end
