# frozen_string_literal: true

# Task
class Task < ApplicationRecord
  validates :name, presence: true
  validates :completed, inclusion: [true, false]
end
