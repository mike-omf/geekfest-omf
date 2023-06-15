# This migration comes from landable (originally 20190916212207)
class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table "#{Landable.configuration.database_schema_prefix}landable_traffic.tags", primary_key: :tag_id do |t|
      t.string :tag
      t.timestamps
    end
  end
end
