class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :image
      t.date :birth
      t.string :from
      t.string :f_food
      t.string :f_human
      t.string :f_music
      t.string :f_object
      t.string :memory
      t.string :dream
      t.text :free

      t.timestamps
    end
  end
end
