class AddProfileDescriptionToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :description, :content
    add_column :users, :url, :string
  end
end
