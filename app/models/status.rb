class Status < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :manager_id, presence: true
  validates :project_name, presence: true
  validates :task, presence: true, length: { maximum: 250 }
  default_scope -> { order(id: :desc) }
end
