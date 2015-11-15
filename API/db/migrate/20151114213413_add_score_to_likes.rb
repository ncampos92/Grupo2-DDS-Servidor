class AddScoreToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :score, :integer
  end
end
