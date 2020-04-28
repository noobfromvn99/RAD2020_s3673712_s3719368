class AddUserAgain < ActiveRecord::Migration[5.2]
  drop_table :users
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :mobile

      t.timestamps
    end
  end
end
