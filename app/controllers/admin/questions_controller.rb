class Admin::QuestionsController < Admin::BaseController
  before_action :find_test, only: %i[create new]
  before_action :find_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show; end

  def new
    @question = @test.questions.build
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test_id)
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to admin_test_path(@question.test_id)
    else
      render :new
    end
  end

  def edit
    @test = Test.find(@question.test_id)
  end

  def update
    if @question.update(question_params)
      redirect_to admin_test_path(@question.test_id)
    else
      render :edit
    end
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not found!'
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
