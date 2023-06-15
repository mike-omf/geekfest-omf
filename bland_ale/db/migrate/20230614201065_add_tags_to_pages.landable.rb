# This migration comes from landable (originally 20150202172400)
class AddTagsToPages < ActiveRecord::Migration[4.2]
  def change
    create_table "#{Landable.configuration.database_schema_prefix}landable.tags", id: :uuid, primary_key: :tag_id do |t|
      t.text :name, null: false
    end

    create_table "#{Landable.configuration.database_schema_prefix}landable.page_tags", id: false do |t|
      t.uuid :page_id, null: false
      t.uuid :tag_id, null: false
      t.timestamp :created_at
    end
  end
end
