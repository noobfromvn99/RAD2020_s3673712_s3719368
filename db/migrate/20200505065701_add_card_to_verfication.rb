class AddCardToVerfication < ActiveRecord::Migration[5.2]
  def change
    add_column :verfications, :card, :string
  end
end
