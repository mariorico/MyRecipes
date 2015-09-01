class Like < ActiveRecord::Base
  # Associations 
  belongs_to :chef
  belongs_to :recipe
  
  validates_uniqueness_of :chef, scope: :recipe
  
end