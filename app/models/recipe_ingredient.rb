class RecipeIngredient < ActiveRecord::Base
  # Associations 
  belongs_to :recipe
  belongs_to :ingredient
end