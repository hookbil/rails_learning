class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_count, on: :create

  scope :correct, -> { where(correct: true) }

  def validate_answers_count
    return if question.answers.length < 5
    errors.add(:answers, 'Count of answers should be from 1 to 4')
  end
end
