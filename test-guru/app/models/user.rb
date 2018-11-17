class User < ApplicationRecord
  has_many :test_status, dependent: :destroy
  has_many :tests, through: :test_status
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify

  scope :test_by_level, -> (user, level)  { 
    user.tests.where(level: level) 
  }
  def user_tests_by_level(level)
    Test.joins("INNER JOIN test_statuses ON tests.id = test_statuses.test_id")
      .where(level: level, test_statuses: { user_id: id })
  end
end
