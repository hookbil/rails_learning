class QuestionsController < ApplicationController
before_action :find_test, only: %i[index create]
	before_action :find_question, only: %i[show destroy]
	rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
	def index
		questions = @test.questions.pluck(:body)
		render plain: questions.join("\n")
	end

	def show
		render plain: @question.body
	end

	def create
		question = @test.questions.new(question_params)
		return render plain: 'Вопрос был успешно создан' if question.save
		render plain: 'Ошибочка'
	end

	def destroy
		@question.destroy
		render plain: 'Вопрос удален'
	end
	
	private
	
	def find_test
		@test = Test.find(params[:test_id])
	end

	def find_question
		@question = Question.find(params[:id])
	end

	def question_params
		params.require(:question).permit(:body)
	end
		
	def rescue_with_question_not_found
		render plain: 'Вопрос не был найден'
	end
end
