class Leave < ApplicationRecord
  belongs_to :user
  enum status: {Hold: 0, Approved: 1, Cancel: 2 }
end
