class User < ApplicationRecord
  has_many :projects
  has_one :manager, through: :user 
  has_many :manager
  
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :confirmable
      
         
  

end
