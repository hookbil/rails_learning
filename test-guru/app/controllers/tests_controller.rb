class TestsController < ApplicationController

  before_action :find_test, only: %i[show]
  after_action :send_log_message
  around_action :log_execute_time

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    #  render html: '<h1>All tests</h1>'.html_safe
    #  byebug
    #logger.info(self.object_id)
    #respond_to do |format|
    #  byebug
    #  format.html { render plain: 'All tests' }
    #  format.json {render json: { tests: Test.all } }
    #end
    result = ["Class : #{params.class}", "Parameters: #{params.inspect}"]
    render plain: result.join("\n")
  end
  def show
    #title = Test.first.title

    #render inline: '<%= title %>'
    render inline: '<%= @test.title %>'
  end
  def new
  end
  def create
    #result = ["Class : #{params.class}", "Parameters: #{params.inspect}"]
		#render plain: result.join("\n")
		test = Test.create(test_params)
		render plain: test.inspect
	end

	def search
    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    
    render plain: result.join("\n")
	end
	
	private

	def test_params
		params.require(:test).permit(:title, :level)
  end
  
  def find_test
    @test = Test.find(params[:id])
  end

  def send_log_message
    logger.info("Action [#{action_name}] was finished")
  end

  def log_execute_time
    start = Time.now
    yield
    finish = Time.now - start
    
    logger.info("Execution time: #{finish * 1000}ms")
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end
end
