class AddUserNameToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :user_name, :string
  end
end
