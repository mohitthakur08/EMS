class Project < ApplicationRecord
  has_and_belongs_to_many :users
  enum status: {active: true, Deactive: false }
  
  default_scope -> {order(created_at: :desc)}
  validates :project_name, presence: true, length: {maximum: 50 }
end
