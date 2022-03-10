class IssueBadgeService
  def self.call(result)
    new(result).issue_badge
  end

  def initialize(result)
    @result = result
  end

  def issue_badge
    Badge.find_each do |badge|
      @result.user.badges.push(badge) if rule_satisfied?(badge)
    end
  end

  private

  def rule_satisfied?(badge)
    "Badges::#{badge.rule.camelcase}".constantize.new(@result, badge).satisfied?
  end
end
