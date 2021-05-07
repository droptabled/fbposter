class Improvement < ApplicationRecord
  belongs_to :user
  has_many :comments
  enum status: [:created, :started, :stopped, :completed]
end
