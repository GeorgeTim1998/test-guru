class Badges::AllTestsOfLevel < Badges::Rules
  def initialize(result, badge)
    super
    @level = badge.achievement.to_i
  end

  def satisfied?
    all_tests_by_level = Test.where(level: @level)
    passed_tests_by_level = @user.tests.where(level: @level)
    all_tests_by_level == passed_tests_by_level
  end
end
