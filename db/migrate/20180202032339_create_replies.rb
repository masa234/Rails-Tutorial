class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.references :user, foreign_key: true
      t.references :micropost, foreign_key: true
      t.text :message
      
      t.timestamps
    end
    add_index :replies, [:micropost_id]
    add_index :replies, [:user_id, :micropost_id]
  end
end
