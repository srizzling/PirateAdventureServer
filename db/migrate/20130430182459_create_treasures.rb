class CreateTreasures < ActiveRecord::Migration
  def change
    create_table :treasures do |t|
      t.string :name
      t.text :description
      t.string :hider
      t.string :seeker
      t.float :long
      t.float :lat
      t.string :keyword
      t.boolean :found

      t.timestamps
    end
  end
end
