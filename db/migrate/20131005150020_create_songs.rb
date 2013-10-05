class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :interpret
      #t.references :interpret, index: true
      t.text :text

      t.timestamps
    end
  end
end
