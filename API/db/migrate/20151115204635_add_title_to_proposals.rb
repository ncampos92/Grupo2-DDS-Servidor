class AddTitleToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :titulo, :string
  end
end
