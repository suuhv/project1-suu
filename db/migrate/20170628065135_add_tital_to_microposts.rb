class AddTitalToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :tital, :text
  end
end
