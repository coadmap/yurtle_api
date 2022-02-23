# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    name { 'xxする' }
    completed { false }
    deadline { Date.today }

    trait :completed do
      completed { true }
    end
  end
end
