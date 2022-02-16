class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[show start]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def start
    @user = User.first
    @user.tests.push(@test)
    redirect_to @user.result(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
