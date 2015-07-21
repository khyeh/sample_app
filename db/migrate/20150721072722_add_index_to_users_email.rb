class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    add_index :users, :email, unique: true
  end
end

# creates a database index on the email column 
# we need each index to be unique so that we have uniqueness in both database and model level