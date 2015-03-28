class Chef < ActiveRecord::Base
  # Validation
  validates :name, presence: true, length:{minimum:3,maximum:4}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true,uniqueness: {case_sensitive: false}, format:{with: VALID_EMAIL_REGEX}
  
  # Relationships
  has_many :recipes
  
  # Callbacks
  before_save{self.email = email.downcase}
end