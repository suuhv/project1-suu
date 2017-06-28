class AddTitleToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :title, :text
  end
end
