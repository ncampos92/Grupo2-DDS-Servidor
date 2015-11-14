class CreateProplikes < ActiveRecord::Migration
  def change
    create_table :proplikes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :proposal, index: true, foreign_key: true
      t.integer :score

      t.timestamps null: false
    end
  end
end
