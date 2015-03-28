class Chef < ActiveRecord::Base
  #Validation
  
  has_many :recipes
  
end