class CreateHighScores < ActiveRecord::Migration
  def change
    create_table :high_scores do |t|
      t.string :username
      t.integer :float
      t.timestamps
    end
  end
end
