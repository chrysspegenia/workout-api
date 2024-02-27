class ChangeCategoriIdNullToTrue < ActiveRecord::Migration[7.1]
  def change
    change_column_null :tasks, :category_id, true
  end
end
