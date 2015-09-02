class EditDigestMisspellingInChef < ActiveRecord::Migration
  def change
    rename_column :chefs, :password_disgest, :password_digest
  end
end
