class RenameHobbyColumnToProfiles < ActiveRecord::Migration[6.1]
  def change
    rename_column :profiles, :hobby, :oshi_name
    rename_column :profiles, :from, :call
    rename_column :profiles, :f_food, :reason
    rename_column :profiles, :f_human, :every
    rename_column :profiles, :f_music, :future
    rename_column :profiles, :memory, :job
    rename_column :profiles, :dream, :favorite_point
  end
end
