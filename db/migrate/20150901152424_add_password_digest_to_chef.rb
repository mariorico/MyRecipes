class AddPasswordDigestToChef < ActiveRecord::Migration
  def change
    add_column :chefs, :password_disgest, :string
  end
end
