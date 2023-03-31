class AddIsPublishedFlagToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :is_published_flag, :boolean
  end
end
