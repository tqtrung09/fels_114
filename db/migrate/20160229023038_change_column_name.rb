class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :words, :image, :sound
  end
end
