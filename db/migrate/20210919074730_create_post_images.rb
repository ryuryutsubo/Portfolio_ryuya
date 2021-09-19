class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.text :quiz
      t.string :image_id
      t.text :hint
      t.integer :user_id

      t.timestamps
    end
  end
end
