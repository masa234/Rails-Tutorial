class RenameRepliesToComments < ActiveRecord::Migration[5.1]
  def change
    rename_table :replies, :comments
  end
end
