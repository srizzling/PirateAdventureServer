class CreateHighScores < ActiveRecord::Migration
  def change
    create_table :high_scores do |t|
      t.string :username
      t.int :float

      t.timestamps
    end
  end
end
