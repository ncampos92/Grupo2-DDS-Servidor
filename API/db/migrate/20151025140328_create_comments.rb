class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :texto
      t.boolean :appproved
      t.references :User, index: true, foreign_key: true
      t.references :Proposal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
