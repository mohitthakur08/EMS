class Project < ApplicationRecord
  belongs_to :user
  
  default_scope -> {order(created_at: :desc)}
  validates :user_id, presence: true
  validates :project_name, presence: true, length: {maximum: 50 }
end
