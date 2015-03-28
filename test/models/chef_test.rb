require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.new(name: "Bob", email: "bob@example.com")
  end
  
  test 'chef must be valid' do
    assert @chef.valid?
  end
  
  test 'name must be present' do
    @chef.name = nil
    assert_not @chef.valid?
  end
  
  # Name
  test 'name should not be too short' do
    @chef.name = "ch"
    assert_not @chef.valid?
  end
  test 'name should not be too long' do
    @chef.name = "chef" * 101
    assert_not @chef.valid?
  end
    
  # Email
  test 'email must be present' do
    @chef.email = nil
    assert_not @chef.valid?
  end 
  test 'email test should accept well format emails' do
    valid_emails = %w[validemail@example.ie email2@example.com user333@example.com bettercallsaul@breakingbad.com testing@test.com]
    valid_emails.each do |ve|
      @chef.email = ve
      assert @chef.valid? '#{ve.inspect} should be valid'
    
    end
  end
  
  test 'email test should not accept bad format emails' do
    invalid_emails = %w[validEmail@example email2example.com user@ betterCallSaul@breakingbad trgssd@ssd@]
    invalid_emails.each do |ie|
      @chef.email = ie
      assert_not @chef.valid? '#{ie.inspect} should be invalid'
    end
  end

  test 'email unique' do
    chef2 = @chef.dup
    chef2.email = @chef.email.upcase
    chef2.save
    assert_not @chef.valid?
  end  
end