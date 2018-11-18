class User < ApplicationRecord
  has_many :test_status, dependent: :destroy
  has_many :tests, through: :test_status
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify

  def tests_by_level(level)
    tests.where(level: level)
  end
end
