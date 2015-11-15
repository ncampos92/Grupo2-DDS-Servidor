class DropApproves < ActiveRecord::Migration
  def change
    drop_table :approves
  end
end
