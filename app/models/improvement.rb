class Improvement < ApplicationRecord
  belongs_to :user
  has_many :improvement_comments, dependent: :destroy
  enum status: [:created, :started, :stopped, :completed]

  validates :name, presence: true
  validates :estimated_effort, numericality: true
  validates :actual_effort, numericality: true
  validates :is_private, inclusion: [true, false]
end
