class User < ApplicationRecord
  has_one :manager, through: :user 
  has_many :manager, through: :admin
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
