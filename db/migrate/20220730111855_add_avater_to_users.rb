class AddAvaterToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :avater, :string
  end
end
