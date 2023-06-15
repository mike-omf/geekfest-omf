# This migration comes from landable (originally 20140501171359)
class AddDeletedAtToAssets < ActiveRecord::Migration[4.2]
  def change
    add_column "#{Landable.configuration.database_schema_prefix}landable.assets", :deleted_at, :timestamp
  end
end
