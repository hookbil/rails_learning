class User < ApplicationRecord
  has_many :test_status, dependent: :destroy
  has_many :tests, through: :test_status
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify
  def user_tests_by_level()
    Test.joins("INNER JOIN test_results ON tests.id = test_results.test_id")
      .where(level: level, test_results: { user_id: id })
  end
end
