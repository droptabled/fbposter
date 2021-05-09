# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: User do
    sequence(:name) { |n| "Facebook person #{n}" }
    email { Faker::Internet.email }
    sequence(:uid) { Faker::Number.number(digits: 10) }
  end
end
