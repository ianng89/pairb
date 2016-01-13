class AddPictureToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :picture, :string
  end
end
