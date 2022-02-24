class GistsController < ApplicationController
  before_action :find_result

  def create
    gist_call = GistQuestionService.new(@result.current_question).call

    flash_options = if gist_call.success?
                      @result.current_question.gists.create!(user: current_user, url: gist_call.url)
                      { notice: t('.success') }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @result, flash_options
  end

  private

  def find_result
    @result = Result.find(params[:result_id])
  end
end
