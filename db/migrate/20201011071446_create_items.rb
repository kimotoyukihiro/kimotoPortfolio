class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.text :review
      t.integer :user_id
      t.string :image_id
      t.timestamps
      t.string :genre
    end
  end
end
