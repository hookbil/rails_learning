class CreateTestResults < ActiveRecord::Migration[5.2]
  def change
    create_table :test_results do |t|
      t.boolean :completed
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true

      t.timestamps
    end
  end
end
