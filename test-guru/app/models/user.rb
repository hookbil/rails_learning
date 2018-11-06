class User < ApplicationRecord
  def user_tests_by_level()
    Test.joins("INNER JOIN test_results ON tests.id = test_results.test_id")
      .where(level: level, test_results: { user_id: id })
  end
end
