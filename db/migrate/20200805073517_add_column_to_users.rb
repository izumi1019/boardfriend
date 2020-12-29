class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :address, :text
    add_column :users, :profile, :text
    add_column :users, :image, :string
  end
end
