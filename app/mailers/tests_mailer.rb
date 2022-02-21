class TestsMailer < ApplicationMailer
  def completed_test(test_passage)
    @user = test_passage.user
    @tests = test_passage.test

    mail to: @user.email, subject: 'You just completed the TestGuru test!'
  end
end
