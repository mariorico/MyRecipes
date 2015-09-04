class Ingredient < ActiveRecord::Base
  # Associations 
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  validates :name, presence: true, length: { minimum:2, maximum:25 }
  
end