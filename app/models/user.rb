class User < ApplicationRecord
  def tests_of_difficulty(level)
    Test.joins('JOIN results ON test_id = tests.id')
        .where(level: level, results: { user_id: id })
  end
end
