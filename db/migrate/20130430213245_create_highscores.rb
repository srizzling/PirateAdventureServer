class CreateHighscores < ActiveRecord::Migration
  def change
    create_table :highscores do |t|
      t.string :username
      t.int :float

      t.timestamps
    end
  end
end
