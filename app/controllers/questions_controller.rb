class QuestionsController < ApplicationController
  before_action :find_test, only: %(index create new)
  before_action :find_question, only: %(show destroy)

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline: '<% @test.questions.each do |question| %><p><%= question.body %></p><% end %>'
  end

  def show
    render inline: '<%= @question.body %>'
  end

  def new; end

  def destroy
    @question.destroy
  end

  def create
    question = @test.questions.create(question_params)
    render plain: question.inspect
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
    params.require(:question).permit(:body, :test_id)
  end
end
