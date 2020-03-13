class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :commenter_id, null: false
      t.integer :commented_id, null: false
      t.text :comment

      t.timestamps
      t.index :commenter_id
      t.index :commented_id
      t.index [:commenter_id, :commented_id]
    end
  end
end
