class User < ApplicationRecord
  has_many :projects 
  has_many :statuses ,dependent: :destroy
  has_many :leaves, dependent: :destroy
  paginates_per 20
  
  
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable , :confirmable 
  end 