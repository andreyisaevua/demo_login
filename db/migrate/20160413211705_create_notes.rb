class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :content
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :notes, [:user_id, :created_at]
  end
end
