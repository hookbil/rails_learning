class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  has_many :test_passings, dependent: :destroy
  has_many :users, through: :tests_passings
  def self.titles_by_category(category_title)
    joins("INNER JOIN categories ON tests.category_id = categories.id")
      .where(categories: { title: category_title }).order(:title).pluck(:title)
  end
end
