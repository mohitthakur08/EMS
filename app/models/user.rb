# frozen_string_literal: true

class User < ApplicationRecord
  has_and_belongs_to_many :projects
  has_many :statuses, dependent: :destroy
  has_many :leaves, dependent: :destroy
  has_many :teammates, class_name: 'User',
                       foreign_key: 'manager_id'
  belongs_to :manager, class_name: 'User',
                       foreign_key: 'manager_id', optional: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  default_scope -> { order(id: :asc) }
  paginates_per 20
end
