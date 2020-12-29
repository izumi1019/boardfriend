class AddColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :title, :text
    add_column :posts, :capacity, :integer
    add_column :posts, :date, :datetime
    add_column :posts, :location, :text
    add_column :posts, :remarks, :text
    add_column :posts, :explanation, :text
    add_column :posts, :participation, :boolean, default: false, null: false
  end
end
