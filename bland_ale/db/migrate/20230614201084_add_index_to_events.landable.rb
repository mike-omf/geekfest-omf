# This migration comes from landable (originally 20160610191015)
class AddIndexToEvents < ActiveRecord::Migration[4.2]
  disable_ddl_transaction!
  def change
    add_index "#{Landable.configuration.database_schema_prefix}landable_traffic.events", :page_view_id, algorithm: :concurrently
  end
end
