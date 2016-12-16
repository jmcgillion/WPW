class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.string :name
      t.string :ancestry
      t.integer :category_id
      t.attachment :image
      t.text :body
      t.timestamps null: false
    end
  end
end
