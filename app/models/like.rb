class Like < ActiveRecord::Base
  # Associations 
  belongs_to :chef
  belongs_to :recipe
end