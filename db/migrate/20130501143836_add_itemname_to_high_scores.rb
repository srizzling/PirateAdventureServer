class AddItemnameToHighScores < ActiveRecord::Migration
  def change
    add_column :high_scores, :itemname, :string
  end
end
