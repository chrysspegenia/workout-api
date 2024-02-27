class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.string :image_url
      t.integer :repetitions
      t.integer :sets
      t.boolean :completed
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
