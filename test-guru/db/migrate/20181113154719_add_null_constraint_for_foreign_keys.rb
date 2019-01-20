class AddNullConstraintForForeignKeys < ActiveRecord::Migration[5.2]
  def change
    change_column_null :questions, :test_id, false
    change_column_null :tests, :category_id, false
    change_column_null :tests, :author_id, false
    change_column_null :answers, :question_id, false
  end
end
