# This migration comes from landable (originally 20131216214027)
class DropBrowserScreenshotTables < ActiveRecord::Migration[4.2]
  def up
    drop_table    "#{Landable.configuration.database_schema_prefix}landable.screenshots"
    drop_table    "#{Landable.configuration.database_schema_prefix}landable.browsers"
  end
end
