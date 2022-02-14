class ResultsController < ApplicationController
  before_action :set_result, only: %i[show update summary]
  def show; end

  def summary; end

  def update
    @result.accept!(params[:answer_ids])

    if @result.completed?
      redirect_to summary_result_path(@test_taker)
    else
      render :show
    end
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end
end
