class AddSnsToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :sns, :string
  end
end
