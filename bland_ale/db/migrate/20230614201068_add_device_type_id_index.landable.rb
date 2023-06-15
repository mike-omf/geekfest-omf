# This migration comes from landable (originally 20150819161154)
class AddDeviceTypeIdIndex < ActiveRecord::Migration[4.2]
  disable_ddl_transaction!

  def up
    add_index "#{Landable.configuration.database_schema_prefix}landable_traffic.user_agents", :device_type_id, algorithm: :concurrently
  end
end
