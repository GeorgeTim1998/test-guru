class Badges::TestOnFirstAttempt < Badges::Rules
  def initialize(result, badge)
    super
    @test_id = badge.achievement.to_i
  end

  def satisfied?
    if @result.successful?
      Result.where(user: @user, test_id: @test_id).count == 1
    else
      false
    end
  end
end
