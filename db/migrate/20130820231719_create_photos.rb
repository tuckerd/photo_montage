class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.references :gallery

      t.timestamps
    end
    add_index :photos, :gallery_id
  end
end
