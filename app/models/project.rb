class Project < ApplicationRecord
  has_and_belongs_to_many :users
  enum status: { active: true, deactive: false }

  default_scope -> { order(created_at: :desc) }
  validates :project_name, presence: true, length: { maximum: 50 }
  validates :status, presence: true
  validates :manager_id, presence: true
end
