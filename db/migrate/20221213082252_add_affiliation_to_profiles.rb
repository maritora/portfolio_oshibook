class AddAffiliationToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :affiliation, :string
    add_column :profiles, :f_object_content, :string
    add_column :profiles, :hobby, :string
  end
end
