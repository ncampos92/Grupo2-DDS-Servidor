class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :recover_digest
      t.string :email
      t.string :gender
      t.date :birth_date
      t.string :region
      t.string :city
      t.string :type
      t.string :user_token
      t.string :first_name
      t.string :last_name

      t.timestamps null: false
    end
  end
end
