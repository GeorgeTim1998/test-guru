class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[show start]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
