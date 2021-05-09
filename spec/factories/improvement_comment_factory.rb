# frozen_string_literal: true

FactoryBot.define do
  factory :improvement_comment, class: ImprovementComment do
    body { "this is a comment" }
    user { create(:user) }
    improvement { create(:improvement, user: user) }
  end
end
