require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def  setup
    @chef = Chef.create(name: "Paul",email: "bob@example.com")
    @recipe = @chef.recipes.build(name:"Chicken",summary:"best chicken in Duclin",description:"1 chicken, 2 tomatoes, 2 onions")
  end
  
  test 'recipe must be valid' do
    assert @recipe.valid?
  end
  
  test 'Chef id should be present' do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
  # NAME
  test 'name should be present' do
    @recipe.name = nil
    assert_not @recipe.valid?
  end
  test 'name should not be too short' do
    @recipe.name = "a"  
    assert_not @recipe.valid?
  end
  test 'name should not be too long' do
    @recipe.name = "a" * 101  
    #puts @recipe.to_yaml
    assert_not @recipe.valid?
  end
  
  # SUMMARY
  test 'summary must be present' do
    @recipe.summary = nil
    assert_not @recipe.valid?
  end
  test 'summary should not be too short' do
    @recipe.summary = "summary"
    assert_not @recipe.valid?
  end
  test 'summary should not be too long' do
    @recipe.summary = "summary" * 201 
    assert_not @recipe.valid?
  end
  
  # DESCRIPTION
  test 'description must be present' do
    @recipe.description = nil
    assert_not @recipe.valid?
  end
  test 'description should not be too short' do
    @recipe.description = "description" 
    assert_not @recipe.valid?
  end
  test 'description should not be too long' do
    @recipe.description = "description" * 501  
    assert_not @recipe.valid?
  end

end