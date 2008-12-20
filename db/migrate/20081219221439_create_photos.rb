class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :path
      t.integer :album_id
      t.boolean :thumbnail, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
