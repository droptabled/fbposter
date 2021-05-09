class Improvement < ApplicationRecord
  belongs_to :user
  has_many :improvement_comments, dependent: :destroy
  enum status: [:created, :started, :stopped, :completed]
end
