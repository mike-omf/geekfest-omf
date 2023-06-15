# This migration comes from landable (originally 20140501171352)
class AddDeletedAtToThemes < ActiveRecord::Migration[4.2]
  def change
    add_column "#{Landable.configuration.database_schema_prefix}landable.themes", :deleted_at, :timestamp
  end
end
