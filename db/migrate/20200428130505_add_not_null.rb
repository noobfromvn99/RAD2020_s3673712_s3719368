class AddNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null : topic, :user_id, false
    change_column_null : topic, :topic_id, false
  end
end
