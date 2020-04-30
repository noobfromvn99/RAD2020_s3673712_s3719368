class AddNotNullToTopic < ActiveRecord::Migration[5.2]
  def change
    change_column_null :posts, :title, false
    change_column_null :posts, :content, false
  end
end
