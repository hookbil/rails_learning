class TestPassage < ApplicationRecord
  PASSAGE_RATING = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def passed?
    total_rating >= PASSAGE_RATING
  end

  def total_rating
    (correct_questions.to_f / questions_count) * 100
  end

  def question_number
    test.questions.find_index(current_question) + 1
  end

  def questions_count
    test.questions.count
  end

  private

  def before_validation_set_question
    return self.current_question = test.questions.first if current_question.nil?
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
      correct_answers_count == answer_ids.count
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def correct_answers
    current_question.answers.correct
  end
end
