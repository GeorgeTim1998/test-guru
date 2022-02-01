class User < ApplicationRecord
  def tests_of_difficulty(level)
    Test.where(author_id: id, level: level)
  end
end
