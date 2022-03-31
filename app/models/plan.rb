class Plan < ApplicationRecord

	has_one :shop, dependent: :destroy
  serialize :key_points, Hash
  enum alias_name: %i[free silver gold platinum]

  FREE_LIMIT = 2
 
end
