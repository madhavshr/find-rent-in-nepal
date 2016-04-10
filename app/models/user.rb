class User < ActiveRecord::Base
	 has_many :rents
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
        
end
