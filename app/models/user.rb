class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :languages 
  has_many :user_certifications
  has_many :certifications, through: :user_certifications
  has_many :code_snippets, through: :languages      
  has_many :learning_resources, through: :languages      

end
