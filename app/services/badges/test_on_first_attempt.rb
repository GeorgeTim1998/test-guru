class Badges::TestOnFirstAttempt < Badges::Rules
  def satisfied?
    @result.successful? && Result.where(user: @user, test_id: @test_id).count == 1
  end
end
