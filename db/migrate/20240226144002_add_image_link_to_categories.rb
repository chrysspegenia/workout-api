class AddImageLinkToCategories < ActiveRecord::Migration[7.1]
  def change
      add_column :categories, :image_link, :string
  end
end
