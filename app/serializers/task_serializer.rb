# frozen_string_literal: true

module V1
  # TaskSerializer
  class TaskSerializer < ActiveModel::Serializer
    attributes :id,
               :name,
               :completed,
               :deadline,
               :created_at,
               :updated_at
  end
end
