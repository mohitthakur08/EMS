class User < ApplicationRecord
  has_and_belongs_to_many :projects 
  has_many :statuses ,dependent: :destroy
  has_many :leaves, dependent: :destroy
  paginates_per 20
  default_scope -> {order(id: :asc)}
  
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable , :confirmable 
  end 