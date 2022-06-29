class Manager < User
  belongs_to :admin
  has_many :project
end
