class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.text :texto
      t.references :User, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
