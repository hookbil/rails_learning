class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_count, on: :create

  scope :correct, -> { where(correct: true) }

  def validate_answers_count
    errors.add(:question, 'Count of answers should be from 1 to 4') if question.answers.count >= 4
  end
end
