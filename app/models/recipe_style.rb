class RecipeStyle < ActiveRecord::Base
  # Associations 
  belongs_to :recipe
  belongs_to :style
end