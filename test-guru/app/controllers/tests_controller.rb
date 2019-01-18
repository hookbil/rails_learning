class TestsController < ApplicationController

  before_action :find_test, only: %i[show]
  after_action :send_log_message
  around_action :log_execute_time

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    # result = ["Class : #{params.class}", "Parameters: #{params.inspect}"]
    # render plain: result.join("\n")
    @tests = Test.all
  end

  def show
    # render inline: '<%= @test.title %>'
    @test = Test.find(params[:id])
  end

  def create
    @test = Test.new(test_params)
    
    if @test.save
      redirect_to @test
    else
      render :new
    end
    #return render plain: test.inspect if test.save
    #render plain: "Ошибка"
  end
  
  def new
    @test = Test.new
  end

  def edit
    @test = Test.find(params[:id])
  end

  def update
    @test = Test.find(params[:id])

    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test = Test.find(params[:id])

    @test.destroy
    redirect_to tests_path
  end

	private

	def test_params
		params.require(:test).permit(:title, :level, :category_id, :author_id)
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
