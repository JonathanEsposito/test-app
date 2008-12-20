class AlterPhotosAddExtension < ActiveRecord::Migration
  def self.up
    add_column :photos, :extension, :string
  end

  def self.down
    remove_column :photos, :extension
  end
end
