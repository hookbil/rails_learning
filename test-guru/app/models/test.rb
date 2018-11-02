class Test < ApplicationRecord
  belongs_to :category
  def self.titles_by_category(category_title)
    joins("INNER JOIN categories ON tests.category_id = categories.id")
      .where("categories.title = ?", category_title).order(:title).pluck(:title)
  end
end
