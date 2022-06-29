class Project < ApplicationRecordas
    belongs_to :manager
    belongs_to :user
    belongs_to :admin
end
