class Badges::AllTestsFromCategory < Badges::Rules
  def initialize(result, badge)
    super
    @category_id = badge.achievement.to_i
  end

  def satisfied?
    all_tests_by_category = Test.where(category_id: @category_id)
    passed_tests_by_category = @user.tests.where(category_id: @category_id)
    all_tests_by_category == passed_tests_by_category
  end
end
