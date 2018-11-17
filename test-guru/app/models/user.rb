class User < ApplicationRecord
  has_many :test_status, dependent: :destroy
  has_many :tests, through: :test_status
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify

  validates :email, presence: true
  scope :test_by_level, -> (user, level)  { 
    user.tests.where(level: level) 
  }

end
