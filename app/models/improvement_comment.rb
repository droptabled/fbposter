class ImprovementComment < ApplicationRecord
  belongs_to :user
  belongs_to :improvement
end
