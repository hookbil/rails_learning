class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  has_many :test_passings, dependent: :destroy
  has_many :users, through: :tests_passings

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level:5..Float::INFINITY) }
  scope :by_category, -> (category_title) {
    joins(:category).where(categories: {title: category_title}).order(:title).pluck(:title)

  }

  validates :title, presence: true, uniqueness: { scope: :level}
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  def self.titles_by_category(category_title)
    joins("INNER JOIN categories ON tests.category_id = categories.id")
      .where(categories: { title: category_title }).order(:title).pluck(:title)
  end
end
