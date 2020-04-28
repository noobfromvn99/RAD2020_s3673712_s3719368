class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :type
    create_table :topics do |t|
      t.string :name

      t.timestamps
    end
  end
end
