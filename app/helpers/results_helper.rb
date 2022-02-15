module ResultsHelper
  def summary_message(result)
    text = if result.successful?
             "<p style='color:Green'>#{result.successful_rate}% </p><p>Test passed</p>"
           else
             "<p style='color:Red'>#{result.successful_rate}% </p><p>Test failed</p>"
           end
    text.html_safe
  end
end
