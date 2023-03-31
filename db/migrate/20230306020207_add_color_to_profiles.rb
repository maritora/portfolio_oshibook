class AddColorToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :color, :string
  end
end
