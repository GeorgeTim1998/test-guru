module QuestionsHelper
  def question_header(question, test)
    action = question.new_record? ? 'Create new' : 'Edit'
    "#{action} #{test.title} question"
  end
end
