class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :user_id
      t.string :name
      t.string :ancestry
      t.integer :note_id
      t.timestamps null: false
    end
  end
end
