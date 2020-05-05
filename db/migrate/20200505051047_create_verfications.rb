class CreateVerfications < ActiveRecord::Migration[5.2]
  def change
    create_table :verfications do |t|
      t.string :fullname
      t.integer :cardnum
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
