# This migration comes from landable (originally 20140501171345)
class AddDeletedAtToPages < ActiveRecord::Migration[4.2]
  def change
    add_column "#{Landable.configuration.database_schema_prefix}landable.pages", :deleted_at, :timestamp
  end
end
