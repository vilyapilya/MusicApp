class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.string :song_title, null: false
      t.integer :album_id, null: false

      t.timestamps
    end
  end
end
