class Badges::Rules
  def initialize(result, badge)
    @user = result.user
    @badge = badge
    @result = result
    @achievement = badge.achievement.to_i
  end
end
