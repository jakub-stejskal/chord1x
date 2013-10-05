class CreateInterprets < ActiveRecord::Migration
  def change
    create_table :interprets do |t|
      t.string :name
      #t.references :songs, index: true

      t.timestamps
    end
  end
end
