class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  PASSAGE_RATING = 0.85

  def completed?
    current_question.nil?
  end
  
  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    self.current_question = next_question
    save!
  end

  def passed?
    (correct_questions / questions_count) >= PASSAGE_RATING
  end

  def total_rating
    (correct_questions / questions_count) * 100
  end

  def question_number
    current_question.id
  end

  def questions_count
    test.questions.count
  end

  private

  def before_validation_set_first_question
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
