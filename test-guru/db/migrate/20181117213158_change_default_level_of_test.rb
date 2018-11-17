class ChangeDefaultLevelOfTest < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tests, :level, from: 0, to: 1
  end
end
