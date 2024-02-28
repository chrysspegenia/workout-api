class RenameImageLinkToImageUrl < ActiveRecord::Migration[7.1]
  def change
    if column_exists?(:categories, :image_url)
      puts "Column 'image_url' already exists in 'categories' table."
    else
      rename_column :categories, :image_link, :image_url
    end
  end
end
