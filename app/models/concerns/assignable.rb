# frozen_string_literal: true

module Assignable
  extend ActiveSupport::Concern

  included do
    has_many :assignees, as: :assignable, dependent: :destroy, class_name: "::Assignee"
  end
end
