# This migration comes from landable (originally 20191028134033)
class DropEventsMeta < ActiveRecord::Migration[5.2]
  def change
    remove_column "#{Landable.configuration.database_schema_prefix}landable_traffic.events", :meta, :jsonb
  end
end
