# frozen_string_literal: true

class Leave < ApplicationRecord
  belongs_to :user
  enum status: { Hold: 0, Approved: 1, Cancel: 2 }
  validates :leave_from, presence: true
  validates :leave_to, presence: true
  validates :leave_reason, presence: true
  default_scope -> { order(created_at: :desc) }
end
