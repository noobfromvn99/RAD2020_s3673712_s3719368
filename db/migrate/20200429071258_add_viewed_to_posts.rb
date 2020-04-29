class AddViewedToPosts < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :email, unique: true
    add_column :posts, :viewed, :integer
    change_column_default(:posts, :viewed, 0)
  end
end
