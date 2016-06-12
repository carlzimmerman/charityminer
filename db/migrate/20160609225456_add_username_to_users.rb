class AddUsernameToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :username, null: false, default: ""
      #t.index [:username], unique: true
    end
    User.update_all "username = email"
    add_index :users, :username, unique: true
  end
end
