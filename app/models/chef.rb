class Chef < ActiveRecord::Base
  # Validation
  validates :name, presence: true, length:{minimum:3,maximum:4}
  validates :email, presence: true, email: true,uniqueness: true
  
  # Relationships
  has_many :recipes
  
end