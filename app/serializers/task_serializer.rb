# frozen_string_literal: true

# TaskSerializer
class TaskSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :completed,
             :deadline,
             :created_at,
             :updated_at
end
