class Chef < ActiveRecord::Base
  # Validation
  validates :name, presence: true, length:{minimum:3,maximum:4}
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, presence: true,uniqueness: {case_sensitive: false}, format:{with: VALID_EMAIL_REGEX}
  
  # Relationships
  has_many :recipes
  
end