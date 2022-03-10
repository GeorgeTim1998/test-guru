class Badges::Rules
  def initialize(result, badge)
    @user = result.user
    @badge = badge
    @result = result
  end
end
