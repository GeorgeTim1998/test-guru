module ResultsHelper
  def summary_message(result)
    text = if result.successful?
             "<p style='color:Green'>#{result.percentage_of_passing}% </p><p>Test passed</p>"
           else
             "<p style='color:Red'>#{result.percentage_of_passing}% </p><p>Test failed</p>"
           end
    text.html_safe # try raw https://apidock.com/rails/String/html_safe
  end
end
