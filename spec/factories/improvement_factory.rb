# frozen_string_literal: true

FactoryBot.define do
  factory :improvement, class: Improvement do
    name { "New Improvement" }
    description { "description for prokect" }
    is_private { false }
    estimated_effort { 0.0 }
    actual_effort { 0.0 }
    status { Improvement.statuses["created"] }
    user { create(:user) }
  end
end
