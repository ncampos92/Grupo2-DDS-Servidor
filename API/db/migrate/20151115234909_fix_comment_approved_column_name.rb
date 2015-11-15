class FixCommentApprovedColumnName < ActiveRecord::Migration
  def change
    rename_column :comments, :appproved, :approved
  end
end
