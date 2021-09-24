class AddPostimagesToAnswer < ActiveRecord::Migration[5.2]
  def change
    add_column :post_images, :answer, :text
  end
end
