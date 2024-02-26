class RenameImageLinkToImageUrl < ActiveRecord::Migration[7.1]
  def change
    rename_column :categories, :image_link, :image_url
  end
end
