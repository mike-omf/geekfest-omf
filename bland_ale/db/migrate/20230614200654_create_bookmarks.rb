class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.string :title
      t.string :url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
